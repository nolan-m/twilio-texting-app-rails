function initialize(){
  $('#save_contact').click(function(){
    $('#name_form').toggle();
  })
}

$(document).ready(initialize);
$(document).on('page:load', initialize);
