module Knowmad
  module Identities
    class Google::Initializer < Initializer
      def google_identity
        GoogleIdentity.find_or_create_by(email: raw_info.email) do |google_identity|
          add_info(google_identity)
          add_raw_info(google_identity)
          add_credentials(google_identity)
        end
      end

      private

      def add_info(google_identity)
        google_identity.name = info.name
        google_identity.first_name = info.first_name
        google_identity.last_name = info.last_name
        google_identity.profile_image_url = info.image
      end

      def add_raw_info(google_identity)
        google_identity.verified = raw_info.email_verfified
      end

      def add_credentials(google_identity)
        google_identity.expires_at = Time.at(credentials.expires_at)
        google_identity.token = credentials.token
      end
    end
  end
end
