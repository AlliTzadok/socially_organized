function attachListeners(){
  $("#calendars-index-button").on("click", calendarsIndex)
  $("#new-calendar-button").on("click", newCalendar)
  $("#post-index-button").on("click", postsIndex)
  $("#new-post-button").on("click", newPost)
  $(".calendarForm").on("submit", createCalendar)
}

$(document).ready(function(){
  attachListeners();
})
