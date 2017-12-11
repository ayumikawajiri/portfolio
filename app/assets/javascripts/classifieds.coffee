# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $ ->
# $(document).ready(function(){

# })
$(document).on 'turbolinks:load', ->
	$('.category-job-field').show()
	$('.category-house-field').hide()
	$('.category-community-field').hide()
	$('select[name="classified[type]"]').on 'change', ->
		if $(@).val() == "job"
			$('.category-job-field').show()
			$('.category-house-field').hide()
			$('.category-community-field').hide()
		if $(@).val() == "house"
			$('.category-job-field').hide()
			$('.category-house-field').show()
			$('.category-community-field').hide()
		if $(@).val() == "community"
			$('.category-job-field').hide()
			$('.category-house-field').hide()
			$('.category-community-field').show()