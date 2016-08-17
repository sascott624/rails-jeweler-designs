$(function(){
  attachListeners();
})

var attachListeners = function(){
  $('#stones').on("click", function(){
    getStones();
  });
  $('#users').on("click", function(){
    getUsers();
  })
}

var getStones = function(){
  // query the db for all stones, then list stones on welcome page
  // getting "/stones" goes to stones#index
  // instead of rendering the index, we're going to render json: @stones
  $.getJSON("/stones.json", function(data){
    var list = "<ul>";
    $.each(data, function(index, stone){
      list += "<li data-id="+ stone["id"] + "><a href='/stones/" + stone["id"] + "'>" + stone["name"] + "</a>: " + stone["weight"] + "ct </li>"
    });
    list += "</ul>"
    $("#stone-list").html(list);
  })
}

var getUsers = function(){
  $.getJSON("/users.json", function(data){
    var list = "<ul>";
    $.each(data, function(index, user){
      list += "<li data-id="+ user["id"] + "><a href='/users/" + user["id"] + "'>" + user["email"] + "</a></li>"
    });
    list += "</ul>"
    $("#user-list").html(list);
  })
}
