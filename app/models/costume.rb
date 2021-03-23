class Costume < ApplicationRecord
    # sets belongs_to relationship for users and actors
    belongs_to :user
    belongs_to :actor

    # allows users to create a new actor while in a costume view
    accepts_nested_attributes_for :actor

    # validates attributes
    validates :role, presence: true
    validates :description, presence: true
    validates :description, length: { maximum: 200}
    validates :actor_id, presence: true

    # sets scope methods to filter for specific attributes
    scope :authentic, -> {where(authentic: true)}
    scope :fantasy, -> {where(authentic: false)}
    scope :finished, -> {where(finished: true)}
    scope :wip, -> {where(finished: false)}

    # setter method that takes actor_attributes as an argument. if there is a name in that hash, an actor with that name is found or created and associated with the costume.
    def actor_attributes=(actor_attributes)
        if actor_attributes["name"] != ""
            actor_attributes.values.each do |actor_attribute|
                actor = Actor.find_or_create_by(name: actor_attribute)
                self.actor = actor
            end
        end
    end

end