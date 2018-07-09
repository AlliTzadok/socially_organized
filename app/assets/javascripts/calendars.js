class Calendar {
  constructor(id, name, admin_id){
    this.id = id;
    this.name = name;
    this.admin_id = admin_id;
  }

  renderName(){
    return(`<strong> ${this.name}</strong>`)
  }
}


$(()=> {
  bindCalendarClickHandlers()
})

const bindCalendarClickHandlers = () => {
  $("#calendars-index-button").on("click", (event) => {
    event.preventDefault()
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
    })

    $("#new-calendar-button").on("click", (event) => {
      event.preventDefault()
      var url = "http://localhost:3000/";
      $("#dashboard-view").empty();
      $.get(url+"calendars/new", function(response){
        // debugger
        var user = response.user;
        $("#dashboard-view").html(response)
      })
    })

    $(".calendarForm").on("submit", (event) => {
      event.preventDefault()
      var url = "http://localhost:3000/";
      $("#dashboard-view").empty();
      const values = $(this).serialize();
      const posting = $.post($(this).attr("action"), values);
      posting.done(function(data){
        const newCalendar = new Calendar(data.calendar.id, data.calendar.name, data.calendar.admin_id)
        debugger
        $('#dashboard-view').append(`Your new calendar: ${newCalendar.renderName()} has been created!`)
      })
    })

  }
