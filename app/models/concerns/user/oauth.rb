class User < ActiveRecord::Base
  module Oauth
    extend ActiveSupport::Concern

    module ClassMethods
      def from_oauth_hash hash
        user = find_or_initialize_by provider: hash['provider'], uid: hash['uid']

        if user.persisted?
          user.update data_from_hash(hash)
        else
          user.assign_attributes data_from_hash(hash)
          user.save
        end

        user
      end

      private

        def data_from_hash hash
          hash['info'].select { |key,value| %w[nickname email name image].include? key }
        end
    end
  end
end