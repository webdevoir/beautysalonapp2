require 'database_cleaner/mongoid/base'
require 'database_cleaner/generic/truncation'
require 'database_cleaner/mongo/truncation_mixin'
require 'database_cleaner/mongo2/truncation_mixin'
require 'database_cleaner/moped/truncation_base'
require 'mongoid/version'

module DatabaseCleaner
  module Mongoid
    class Truncation
      include ::DatabaseCleaner::Mongoid::Base
      include ::DatabaseCleaner::Generic::Truncation

      if ::Mongoid::VERSION < '3'

        include ::DatabaseCleaner::Mongo::TruncationMixin

        private

        def database
          ::Mongoid.database
        end

      elsif ::Mongoid::VERSION < '5'

        include ::DatabaseCleaner::Moped::TruncationBase

        private

        def session
          ::Mongoid.default_session
        end

        def database
          if not(@db.nil? or @db == :default)
            ::Mongoid.databases[@db]
          else
            ::Mongoid.database
          end
        end

      else

        include ::DatabaseCleaner::Mongo2::TruncationMixin

      end
    end
  end
end