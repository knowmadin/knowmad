// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var subdomainField = $('.subdomain-field'),
  mirrorInput = $('.mirror-input');

subdomainField.on('keyup focus paste', function() {
  subdomainField.removeAttr('placeholder');
  mirrorInput.val(subdomainField.val() + '.knowmad.in');
});

subdomainField.on('blur', function() {
  debugger;
  if (subdomainField.val().length === 0) {
    debugger;
    subdomainField.attr('placeholder', 'subdomain.knowmad.in');
    mirrorInput.val('');
  }
});
