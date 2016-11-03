$(document).on('turbolinks:load', function() {
  $('.nav .product_type').on('click', function(e) {
    e.preventDefault();
    var product_type_id;
    product_type_id = $(this).data("id");
    if (product_type_id) {
      $.getScript('/?product_type_id=' + product_type_id);
      return;
    }
  });
});
