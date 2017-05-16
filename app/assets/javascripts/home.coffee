# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

getUser = (realm, name) ->
  $.getJSON '/v1/app/' + name + '/' + realm, (data) ->
    $.each data, (key, value) ->
      $('#playerapplication_player_class').val value['wow']['class']
      $('#playerapplication_player_mainspec').val value['wow']['spec']
      $('#playerapplication_player_mainspec_awt').val value['wow']['gear']['artifact']
      $('#playerapplication_link_wowprogress').val value['wowprogress']['link']
      $('#playerapplication_link_warcraftlogs').val value['warcraftlogs']['link']
      return  
    return
  $('#details').show();
  return

$ ->
  ready = ->
      $('#spec_icons').imagepicker
        hide_select: true
        show_label: false
      if $('#error_explanation').length == 0
        $('#details').hide()
      $('#prefill').click (event) ->
        event.preventDefault()
        getUser $('#playerapplication_player_realm').val(), $('#playerapplication_player_name').val()
        return false
      $('#manual').click (event) ->
        event.preventDefault()
        $('#details').show();
      $('#content').trumbowyg()

      
  #$(document).ready(ready)
  $(document).on('turbolinks:load', ready)