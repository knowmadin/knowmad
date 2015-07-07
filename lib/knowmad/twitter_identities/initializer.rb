module Knowmad
  module FacebookIdentities
    class Initializer
      def initialize(auth_hash)
        @auth_hash = auth_hash
      end

      def twitter_identity
        TwitterIdentity.find_or_create_by(screen_name: raw_info.screen_name) do |twitter_identity|
          add_raw_info(twitter_identity)
          add_credentials(twitter_identity)
        end
      end

      private

      attr_reader :auth_hash

      def add_raw_info(twitter_identity)
        twitter_identity.name = raw_info.name
        twitter_identity.twitter_id = raw_info.id
        twitter_identity.profile_image_url = raw_info.profile_background_image_url_https
      end

      def add_credentials(twitter_identity)
        twitter_identity.token = credentials.token
        twitter_identity.secret = credentials.secret
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
