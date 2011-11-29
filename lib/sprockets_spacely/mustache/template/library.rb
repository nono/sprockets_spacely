module Sprockets
  module Mustache
    module Template
      class Library

        def self.value=(val)
          @@value = val
        end

        def self.value
          @@value
        end

      end
    end
  end
end
