class Wishlist < ApplicationRecord
    belongs_to :user, optional: true
    has_many :products, dependent: :nullify
end
