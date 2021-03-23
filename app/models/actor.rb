class Actor < ApplicationRecord
    # sets has_many relationship with costumes
    has_many :costumes
    # sets has_many through relationship with user
    has_many :users, through: :costumes

    # scope method to allow users to search for a particular actor. Returns a list of actors whose names are similar to the search term
    scope :found, -> (name) {where("name LIKE ?", "%#{name}%" )}
end
