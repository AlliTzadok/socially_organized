class Calendar {
  constructor(id, name, admin_id){
    this.id = id;
    this.name = name;
    this.admin_id = admin_id;
  }
}

function showCalendars(event){
  // debugger
  event.preventDefault()
  event.stopPropagation()
  //need GET calendars Index
  //Tell Jquery to load
  var url = "http://localhost:3000/";
  $.get(url+"calendars.json", function(response){
    //append index to DOM
    var user = response.user;

    response.calendars.forEach(function(calendar) {
      $("#calendars").append(`
        <div id="calendar-${calendar.id}">
        <h4> <a href="/users/${user.id}/calendars/${calendar.id}">${calendar.name}</a>
        </h4>
        </div>
        `)
      })
    })
  }
