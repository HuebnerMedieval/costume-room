class Costume < ApplicationRecord
    belongs_to :user
    belongs_to :actor

    accepts_nested_attributes_for :actor

    validates :role, presence: true
    validates :description, presence: true
    validates :description, length: { maximum: 200}
    validates :actor_id, presence: true

    scope :authentic, -> {where(authentic: true)}
    scope :fantasy, -> {where(authentic: false)}
    scope :finished, -> {where(finished: true)}
    scope :wip, -> {where(finished: false)}

    def actor_attributes=(actor_attributes)
        if actor_attributes["name"] != ""
            actor_attributes.values.each do |actor_attribute|
                actor = Actor.find_or_create_by(name: actor_attribute)
                self.actor = actor
            end
        end
    end

end