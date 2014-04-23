function initialize(){
  $('#add-contact').on('click', function(){
    $('#contacts').append($("#add_contact_form").html());
    $('#save-check').hide();
    $('#contact-btn').hide();
  });
}




$(document).ready(initialize);
$(document).on('page:load', initialize);
