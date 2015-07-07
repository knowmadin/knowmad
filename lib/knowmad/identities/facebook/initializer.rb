module Knowmad
  module Identities
    module Facebook
      class Initializer < Knowmad::Identities::Initializer
        def facebook_identity
          FacebookIdentity.find_or_create_by(email: raw_info.email) do |facebook_identity|
            add_info(facebook_identity)
            add_raw_info(facebook_identity)
            add_credentials(facebook_identity)
          end
        end

        private

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
      end
    end
  end
end
