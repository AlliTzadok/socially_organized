class Calendar {
  constructor(id, name, admin_id){
    this.id = id;
    this.name = name;
    this.admin_id = admin_id;
  }
}


function showCalendars(event){
  debugger
  event.preventDefault()
  //need GET calendars Index
  //Tell Jquery to load
  var url = "http://localhost:3000";
  $.get(url+"/calendars.json", function(calendars){
    //append index to DOM
    console.log(calendars);
    $("#dashboard").append()
  })
}
