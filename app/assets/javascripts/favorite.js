$(document).ready(function() {

  $('#fav-form').on('submit', function(event){
    event.preventDefault();

    var workout = $("#favorite_workout_id").val()
    debugger;
    var fav_request = $.ajax({
      url: '/favorites.json',
      method: "POST",
      data: { workout_id: workout }
    })

    fav_request.done(function(){
      alert("dope");
    })
  });
});
