class WishlistsController < ApplicationController
     def index
        render json: {wishlists: Wishlist.all}, include: :products
      end
    
      def show
        @wish = Wishlist.find(params[:id])
        render json: @wish.to_json(include: :products)
      end
    
      def create
        @new_wish = Wishlist.new(wishlist_params)
        if @new_wish.save
          render json: @new_wish.to_json(include: :products)
        else
          render json: { message: 'Some feilds are invalid', errors: @new_wish.errors}, status: :bad_request 
        end
      end
    
      def update
        @wish = Wishlist.find(params[:id])
        if @wish.update(wishlist_params)
          render json: @wish.to_json(include: :products)
        else
          render json: { message: 'Some feilds are invalid', errors: wish.errors}, status: :bad_request 
        end
      end
    
      def destroy
        @wish = Wishlist.find(params[:id])
        @wish.destroy
        render json: { message: "Wishlist #{params[:id]} deleted"}
      end
    
      private
      # We'll set up to accept request bodies in JSON API format (see: https://stackoverflow.com/questions/31594567/strong-parameters-json-api-rails)
      def wishlist_params
        params
          .require(:data)
          .require(:attributes)
          .permit(
            :user_id,
            :wishlist_id,
            :product_id,
            :name
          )
      end
    end
end
