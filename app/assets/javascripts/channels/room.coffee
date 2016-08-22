App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.message.blank?
      $('#messages').append '<div class="message">' +
        '<div class="message-user">' + data.user + ":" + '</div>' +
        data.message + '</div>' + '</div>'
      scroll_bottom()


$(document).on 'turbolinks:load', ->
  scroll_bottom()
  submit_message()

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)

submit_message = () ->
  $('textarea#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('[data-send="message"]').click()
      event.target.click()
      event.target.value = ""
      event.preventDefault()