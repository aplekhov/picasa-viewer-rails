# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ ->
  $(document).on
    "ajax:beforeSend": (e, xhr, settings) ->
      if $(e.target).find('input[type=text]').val() == ''
        return false
      else
        $(e.target).find('.spinner').show()
        $(e.target).find('input[type=submit]').attr('disabled','disabled')
    "ajax:success": (e, data, status, xhr) ->
      $(e.target).find('.spinner').hide()
      $(e.target).find('input[type=submit]').removeAttr 'disabled'
      $(e.target).find('input[type=text]').val ''
    "ajax:error": (e, xhr, status, error) ->
      $(e.target).find('.spinner').hide()
      $(e.target).find('input[type=submit]').removeAttr 'disabled'
