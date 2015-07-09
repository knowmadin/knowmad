// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var subdomainField = $('.subdomain-field');

subdomainField.on('change focus', function() {
  $('.mirror-input').val(subdomainField.val() + '.knowmad.in');
});