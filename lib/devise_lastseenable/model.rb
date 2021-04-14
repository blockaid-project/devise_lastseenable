require 'devise_lastseenable/hooks/lastseenable'

module Devise
  module Models
    module Lastseenable
      def stamp!
        if self.last_seen.to_i < (Time.now - 5.minutes).to_i
          self.update_attribute(:last_seen, DateTime.now)
        end
      end
    end
  end
end
