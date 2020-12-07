class Actor < ApplicationRecord
    has_many :costumes
    has_many :users, through: :costumes

    scope :found, -> (name) {where("name LIKE ?", "%#{name}%" )}
end
