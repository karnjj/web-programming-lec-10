class ShopController < ApplicationController
    # before_action :set_items, only: %i[ show ]
    before_action :must_be_logged_in, only: %i[ buy_item ]

    helper_method :is_login?
    def show
        seller_id = params[:seller_id]
        @seller = User.find(seller_id)
    end

    def buy_item
        seller_id = params[:seller_id]
        item_id = params[:item_id]
        buyer_id = session[:user_id]

        item = Item.find(item_id)

        if(item.stock > 0)
            inventory = Inventory.new
            inventory.user_id = buyer_id
            inventory.item_id = item_id
            inventory.price = item.price

            item.stock = item.stock - 1;

            if (inventory.save && item.save)
                redirect_to shop_path(seller_id)
            end
        end


    end

    # private
    # def set_items
    #   user = User.find(params[:user_id])
    #   @items = user.items
    # end

end
