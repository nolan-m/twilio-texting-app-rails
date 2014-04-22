function initialize(){
  $('#add-contact').click(function(){
    $('#contacts').append($("#add_contact_form").html());
    $('#save-check').hide();
    $('#contact-btn').hide();
  });

$( "select#to_tags_" )
  .change(function () {
    var str = "";
    $( "option:selected" ).each(function() {
      str = $( this ).val();
    });
    $( "#contact_field" ).val( str );
  })
  .change();
}





$(document).ready(initialize);
$(document).on('page:load', initialize);
