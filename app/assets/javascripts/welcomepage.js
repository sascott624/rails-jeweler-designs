$(function(){
  attachListeners();
  $('#design-list').hide();
})

var attachListeners = function(){
  $("#designs").on("click", function(){
    showDesigns();
  })
  $('#stones').on("click", function(){
    getStones();
  });
  $('#users').on("click", function(){
    getUsers();
  })
}

var showDesigns = function(){
  $('#design-list').show();
}

var getStones = function(){
  $.getJSON("/stones.json", function(data){
    var list = "<ul>";
    $.each(data, function(index, stone){
      list += "<li data-id="+ stone["id"] + "><a href='/stones/" + stone["id"] + "'>" + stone["name"] + "</a>: " + stone["weight"] + "ct </li>"
    });
    list += "</ul> <a href='/stones/new'> New </a>";
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
