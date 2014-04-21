function initialize(){
  $('#save_contact').click(function(){
    $('#name_form').toggle();
  })
  $('#contact-btn').click(function() {
    $('#contacts-dropdown').toggle();
    $('#to-field').toggle();
    $('#save-check').toggle();
    $(this).text(function(i, text){
      return text === "New Contact" ? "Select From Contacts" : "New Contact";
    });
  });
}

$(document).ready(initialize);
$(document).on('page:load', initialize);
