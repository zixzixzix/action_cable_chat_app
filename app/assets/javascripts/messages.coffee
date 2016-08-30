# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

message_appender = (username, content) ->
  $('#messages-table').append username + ": " + content

$(document).on 'turbolinks:load', ->
  message_appender('michael', 'hello, world!')