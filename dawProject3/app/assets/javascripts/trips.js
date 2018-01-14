$(document).on("turbolinks:load",function(){
  $('.fecha').datepicker({dateFormat: 'dd-mm-yy'});
  console.log("document ready");
});