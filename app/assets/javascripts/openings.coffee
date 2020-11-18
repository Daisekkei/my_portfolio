# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  app.init()
  
app =
  text: "Hello stranger. How are you doing?"
  index: 0
  chars: 0
  speed: 100
  container: ".text .content"
  
  init: ->
    @chars = @text.length
    @write()
    
  write: ->
    $(@container).append @text[@index]
    if @index < @chars
      @index++
      window.setTimeout ->
        app.write()
      , @speed