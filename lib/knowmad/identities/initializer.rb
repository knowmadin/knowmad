module Knowmad
  module Identities
    class Initializer
      def initialize(auth_hash)
        @auth_hash = auth_hash
      end

      private

      attr_reader :auth_hash

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
