# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  scroll_bottom = () ->
    $('#messages').scrollTop($('#messages')[0].scrollHeight)

  submit_message = () ->
    $('textarea#message_content').on 'keydown', (event) ->
      if event.keyCode is 13
        $('[data-send="message"]').click()
        event.target.click()
        event.target.value = ""
        event.preventDefault()

  scroll_bottom()
  submit_message()

  console.log $('#messages')[0]


  $('#messages').append '<div class="message">' +
    '<div class="message-user">' + "foo" + ":" + '</div>' +
    "bar" + '</div>' + '</div>'
  scroll_bottom()
