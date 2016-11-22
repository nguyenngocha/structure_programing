// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require nested_attributes
//= require ckeditor/init
//= require frontend/jquery.flexisel
//= require frontend/jquery.flexslider
//= require frontend/responsiveslides.min
//= require custom

$(document).on('turbolinks:load', function() {
  setTimeout(function() {
    $('.alert').fadeOut('normal');
  }, 3000);
});

$(document).on('turbolinks:load', function() {
  $('.load-more').on('click', function(e){
    e.preventDefault();
    var more_posts_url;
    more_posts_url = $('.pagination .next a').attr('href');
    if (more_posts_url) {
      $.getScript(more_posts_url);
      return;
    }
  });
});

$(document).on('turbolinks:load', function() {
  $('body').on('click','.search', function(e){
    var search;
    e.preventDefault();
    search = document.getElementById('search_form');
    $.getScript('/?q=' + search.value);
  })
});

$(document).on('turbolinks:load', function() {
  $("body").on('keypress','.form',function (event) { 
    if (event.which == 13) { 
      $(this).find(".search").click(); 
      return false; 
    }
  });
});

$(document).on('turbolinks:load', function() {
  $(window).load(function() {
    $("#flexiselDemo3").flexisel({
      visibleItems: 4,
      animationSpeed: 1000,
      autoPlay: true,
      autoPlaySpeed: 3000,
      pauseOnHover: true,
      enableResponsiveBreakpoints: true,
        responsiveBreakpoints: { 
        portrait: { 
          changePoint:480,
          visibleItems: 1
        }, 
        landscape: { 
          changePoint:640,
          visibleItems: 2
        },
        tablet: { 
          changePoint:768,
          visibleItems: 3
        }
      }
    });
  });

  $(function () {
    $("#slider4").responsiveSlides({
      auto: true,
      pager:true,
      nav:false,
      speed: 500,
      namespace: "callbacks",
      before: function () {
        $('.events').append("<li>before event fired.</li>");
      },
      after: function () {
        $('.events').append("<li>after event fired.</li>");
      }
    });
  });

  $(window).load(function() {
    $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
    });
  });
});
