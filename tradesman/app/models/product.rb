class Product < ApplicationRecord
    belongs_to :wishlist, optional: true  
end
