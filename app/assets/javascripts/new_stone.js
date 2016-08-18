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
      var newStone = new Stone(data["name"], data["weight"], data["cost"], data["id"], data["designs"], data["users"]);
      newStone.createHTML();
    //   $('#show').show();
    //   $('#stoneDetails').text("Stone Details");
    //   $('#stoneName').html("Name: " + data["name"]);
    //   $('#stoneWeight').html("Weight: " + data["weight"] + " ct");
    //   $('#stoneCost').html("Cost: $" + data["cost"]);
    //   $('#linkToStone').html("<a href='/stones/" + data["id"] + "'>View in Index</a>");
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
  console.log("this will be the prototype function")
  }
