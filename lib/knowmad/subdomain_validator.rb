class SubdomainValidator < ActiveModel::EachValidator
  RESERVED_SUBDOMAINS = [
    'about', 'abuse', 'account', 'accounts', 'admin', 'admins', 'administrator', 'administrators', 'anonymous',
    'assets', 'billing', 'billings', 'board', 'calendar', 'contact', 'copyright', 'e-mail', 'email', 'example',
    'feedback', 'forum', 'hostmaster', 'image', 'images', 'inbox', 'index', 'invite', 'jabber', 'legal', 'launchpad',
    'manage', 'media', 'messages', 'mobile', 'official', 'payment', 'picture', 'pictures', 'policy', 'portal',
    'postmaster', 'press', 'privacy', 'private', 'profile', 'search', 'sitemap', 'staff', 'stage', 'staging', 'static',
    'stats', 'status', 'support', 'teams', 'username', 'usernames', 'users', 'webmail', 'webmaster', 'login', 'use',
    'jars', 'main', 'data', 'jobs', 'careers', 'ssl', 'smtp', 'mail', 'www', 'ftp', 'mail', 'pop', 'sftp', 'careers',
    'jobs', 'finance', 'hr', 'product', 'user', 'img', 'stylesheets', 'cdn', 'gallery', 'api', 'security', 'invest',
    'investing', 'investments', 'apps', 'app'
  ]

  def validate_each(object, attribute, value)
    return unless value.present?

    if RESERVED_SUBDOMAINS.include?(value)
      object.errors[attribute] << 'cannot be a reserved name'
    end

    object.errors[attribute] << 'must have between 3 and 63 letters' unless (3..63).include?(value.size)
    object.errors[attribute] << 'cannot start or end with a hyphen' unless value =~ /^[^-].*[^-]$/i
    object.errors[attribute] << 'must be alphanumeric; A-Z, 0-9 or hyphen' unless value =~ /^[a-z0-9\-]*$/i
  end
end
