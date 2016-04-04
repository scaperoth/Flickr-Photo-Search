# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  # hide spinner
  $('.spinner').hide()
  # show spinner on AJAX start
  $(document).ajaxStart ->
    $('.spinner').show()
    return
  # hide spinner on AJAX stop
  $(document).ajaxStop ->
    $('.spinner').hide()
    return
  return
