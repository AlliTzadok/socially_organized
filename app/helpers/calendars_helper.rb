module CalendarsHelper

  def collaborators?(calendar)
    calendar.users.count > 1
  end 
end
