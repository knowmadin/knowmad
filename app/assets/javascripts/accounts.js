// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$('.subdomain-field').on('keyup focus', function() {
  $('.mirrorInput').val($('.realInput').val() + ".knowmad.in");
});