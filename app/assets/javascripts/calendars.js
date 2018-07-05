class Calendar {
  constructor(id, name, admin_id){
    this.id = id;
    this.name = name;
    this.admin_id = admin_id;
  }
}

function attachListeners(){
  $("#calendars-index-button").on("click", calendarsIndex)
  $("#new-calendar-button").on("click", newCalendar)
  $("#post-index-button").on("click", postsIndex)
}

$(document).ready(function(){
  attachListeners();
})

function calendarsIndex(event){
  event.preventDefault()
  // event.stopPropagation()

  //need GET calendars Index
  //Tell Jquery to load
  var url = "http://localhost:3000/";
  $("#dashboard-view").empty();
  $.get(url+"calendars.json", function(response){
    //append index to DOM
    var user = response.user;
    response.calendars.forEach(function(calendar) {
      $("#dashboard-view").append(`
        <div id="calendar-${calendar.id}">
        <h4>
        <a href="/users/${user.id}/calendars/${calendar.id}">${calendar.name}
        </a>
        </h4>
        </div>
        `)
      })
    })
  }

function postsIndex(event){
    event.preventDefault()

    var url = "http://localhost:3000/";
    $("#dashboard-view").empty();
    $.get(url+"posts.json", function(response){
      debugger
      var user = response.user;
      response.posts.forEach(function(post){
        $("#dashboard-view").append(`
          <div id="post-${post.id}">
          `)
      })
    })
  }

  function newCalendar(event){
    event.preventDefault()

    var url = "http://localhost:3000/";
    $("#dashboard-view").empty();
    $.get(url+"calendars/new", function(response){
      // debugger
      var user = response.user;
      $("#dashboard-view").html(response)
    })
  }
