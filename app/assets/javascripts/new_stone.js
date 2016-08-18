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
      var newStone = new Stone(data["name"], data["weight"], data["cost"], data["id"], data["designs"], data["users"]);
      $('#show').show();
      $('#stoneDetails').text("Stone Details");
      newStone.createHTML();
    })
  })
};

function Stone(name, weight, cost, id, designs, users){
  this.name = name;
  this.weight = weight;
  this.cost = cost;
  this.id = id;
  this.designs = [];
  this.users = [];
}

Stone.prototype.createHTML = function(){
    $('#stoneName').text("Name: " + this.name);
    $('#stoneWeight').text("Weight: " + this.weight + " ct");
    $('#stoneCost').text("Cost: $" + this.cost);
    $('#linkToStone').html("<a href='/stones/" + this.id + "'>View in Index</a>");
  }
