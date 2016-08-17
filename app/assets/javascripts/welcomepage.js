//
// <h2 id="stones"><%= link_to "View All Stones", stones_path %></h2>
//
//
// <h2 id="users"><%= link_to "View All Users", users_path %></h2>

$(function(){
  attachListeners();
})

var attachListeners = function(){
  $('#stones').on("click", function(){
    getStones();
  })
}

var getStones = function(){
  // query the db for all stones, then list stones on welcome page
  // getting "/stones" goes to stones#index
  // instead of rendering the index, we're going to render json: @stones
}
