module Knowmad
  module FacebookIdentities
    class Initializer
      def initialize(auth_hash)
        @auth_hash = auth_hash
      end

      def facebook_identity
        FacebookIdentity.find_or_create_by(email: raw_info.email) do |facebook_identity|
          add_info(facebook_identity)
          add_raw_info(facebook_identity)
          add_credentials(facebook_identity)
        end
      end

      private

      attr_reader :auth_hash

      def add_info(facebook_identity)
        facebook_identity.name = info.name
        facebook_identity.first_name = info.first_name
        facebook_identity.last_name = info.last_name
        facebook_identity.profile_image_url = info.image
      end

      def add_raw_info(facebook_identity)
        facebook_identity.verified = raw_info.verfified
        facebook_identity.facebook_id = raw_info.id
      end

      def add_credentials(facebook_identity)
        facebook_identity.expires_at = Time.at(credentials.expires_at)
        facebook_identity.token = credentials.token
      end

      def info
        @raw_info ||= auth_hash.info
      end

      def raw_info
        @raw_info || auth_hash.extra.raw_info
      end

      def credentials
        @credentials ||= auth_hash.credentials
      end
    end
  end
end
