App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $.ajax(url: "/rooms/show", dataType: 'script');

  speak: (message, id) ->
    @perform 'speak', message: message, user_id: id
$(document).on 'keypress', "[data-behaviour~=room_speaker]", (event) ->
  if event.keyCode is 13
    App.room.speak(event.target.value, $("#user_id").val());
    event.target.value = ''
    event.preventDefault();
