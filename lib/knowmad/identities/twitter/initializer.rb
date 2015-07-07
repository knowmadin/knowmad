module Knowmad
  module Identities
    module Twitter
      class Initializer < Knowmad::Identities::Initializer
        def twitter_identity
          TwitterIdentity.find_or_create_by(screen_name: raw_info.screen_name) do |twitter_identity|
            add_raw_info(twitter_identity)
            add_credentials(twitter_identity)
          end
        end

        private

        def add_raw_info(twitter_identity)
          twitter_identity.name = raw_info.name
          twitter_identity.twitter_id = raw_info.id
          twitter_identity.profile_image_url = raw_info.profile_background_image_url_https
        end

        def add_credentials(twitter_identity)
          twitter_identity.token = credentials.token
          twitter_identity.secret = credentials.secret
        end
      end
    end
  end
end
