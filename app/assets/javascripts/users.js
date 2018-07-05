function attachListeners(){
  $("#calendars-index-button").on("click", calendarsIndex)
  $("#new-calendar-button").on("click", newCalendar)
  $("#post-index-button").on("click", postsIndex)
}

$(document).ready(function(){
  attachListeners();
})
