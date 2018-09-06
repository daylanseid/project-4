class User < ApplicationRecord
    has_many :wishlists, dependent: :nullify
end
