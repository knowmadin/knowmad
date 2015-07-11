$(document).ready(function() {
  var subdomainField = $('.subdomain-field'),
    mirrorInput = $('.mirror-input');

  subdomainField.on('keyup focus paste', function() {
    subdomainField.removeAttr('placeholder');
    mirrorInput.val(subdomainField.val() + '.knowmad.in');
  });

  subdomainField.on('blur', function() {
    if (!subdomainField.val().length) {
      subdomainField.attr('placeholder', 'subdomain.knowmad.in');
      mirrorInput.val('');
    }
  });

  if (subdomainField.val().length) {
    mirrorInput.val(subdomainField.val() + '.knowmad.in');
  }
});
