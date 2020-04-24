class Place < ApplicationRecord
    has_many :joins, dependent: :destroy
    has_many :users, through: :joins
    has_many :posts, dependent: :destroy

end
