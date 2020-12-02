class Actor < ApplicationRecord
    has_many :costumes
    has_many :users, through: :costumes
end
