$(document).on('turbolinks:load', function() {
  $('#show').hide();
  submitForm();
})

var submitForm = function(){
  $('form').submit(function(e){
    e.preventDefault();
    var values = $(this).serialize();
    var submitting = $.post('/stones', values);
    submitting.done(function(data){
      $('#show').show();
      $('#stoneDetails').text("Stone Details");
      $('#stoneName').html("Name: " + data["name"]);
      $('#stoneWeight').html("Weight: " + data["weight"] + "ct");
      $('#stoneCost').html("Cost: $" + data["cost"]);
      $('#linkToStone').html("<a href='/stones/" + data["id"] + "'>View in Index</a>");
    })
  })
}
