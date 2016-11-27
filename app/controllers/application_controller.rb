class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :namespace
  before_action :cog_user

  def after_sign_in_path_for resource
    get_root_path
  end

  def verify_admin
    unless current_user.admin?
      flash[:danger] = t "admin.authorize"
      redirect_to root_path
    end
  end

  def cog_user
    @current_user = current_or_guest_user
    unless @current_user.admin?
      @cart = @current_user.carts.find_by status: "init"
      @cart ||= @current_user.carts.create!
    end
  end

  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        guest_user(with_retry = false).reload.try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user with_retry = true
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound
     session[:guest_user_id] = nil
     guest_user if with_retry
  end

  private
  def namespace
    @namespace = self.class.parent.to_s.downcase
  end

  def get_root_path
    if current_user.admin?
      admin_root_path
    else
      root_path
    end
  end

  def create_guest_user
    u = User.create(name: "guest", email: "guest_#{Time.now.to_i}#{rand(100)}@example.com", role: "guest" )
    u.save!(validate: false)
    session[:guest_user_id] = u.id
    u
  end
end
