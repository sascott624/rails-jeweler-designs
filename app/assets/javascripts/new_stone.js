$(document).on('turbolinks:load', function() {
  $('#show').hide();
  submitForm();
})

var submitForm = function(){
  $('#new_stone').submit(function(e){
    e.preventDefault();
    var values = $(this).serialize();
    var submitting = $.post('/stones', values);
    submitting.done(function(data){
      // here, instead of rendering JSON, create a JS stone object wtih a
      // prototype method that renders the stone.name, etc. in the page
      $('#show').show();
      $('#stoneDetails').text("Stone Details");
      $('#stoneName').html("Name: " + data["name"]);
      $('#stoneWeight').html("Weight: " + data["weight"] + " ct");
      $('#stoneCost').html("Cost: $" + data["cost"]);
      $('#linkToStone').html("<a href='/stones/" + data["id"] + "'>View in Index</a>");
    })
  })
}
