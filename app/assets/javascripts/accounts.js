// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var subdomainField = $('.subdomain-field');

subdomainField.on('keyup focus paste', function() {
  subdomainField.removeAttr('placeholder');
  $('.mirror-input').val(subdomainField.val() + '.knowmad.in');
});
