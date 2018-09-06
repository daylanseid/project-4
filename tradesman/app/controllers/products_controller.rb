class ProductsController < ApplicationController
    def index
        if (paramas[:wishlist_id])
            render json: { messsage "Get all products for wishlist #{params[:wishlist_id]}"}
        else 
            render json: { message: "Get all products" }
    end
    
    def show
        render json: { message: "Get productt #{params[:id]}"}
    end
    
    #def create
        if 
          render json: @new_prod.to_json
        else
          render json: { message: 'Some feilds are invalid', errors: @new_prod.errors}, status: :bad_request 
        end
    end
    
    def update
        render json: { message: "Update a product #{paramas[Laparm"}
    end
    
    def destroy
    end
    
    private
    def product_params
        params
        .require(:data)
        .require(:attributes)
        .permit(
          :product_id,
          :product_name,
          :company_name,
          :price,
          :decription,
          :image,
          :wishlist_id
        )
    end
end