function attachListeners(){
  $("#user-calendars-button").unbind("click").click(()=> showCalendars(event));
}

$(document).ready(function(){
  attachListeners();
})
