class Costume < ApplicationRecord
    belongs_to :user
    belongs_to :actor

    accepts_nested_attributes_for :actors

    def actors_attributes=(actor_attributes)
        actor_attributes.values.each do |actor_attribute|
            actor = Actor.find_or_create_by(actor_attribute)
            self.actor = actor
        end
    end

end
