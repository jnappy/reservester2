class RestaurantsController < ApplicationController 

    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user!, :except => [:index, :show]
    





    def index
        @restaurants=Restaurant.all
    end

    def show
    end



    def new
        @restaurant = Restaurant.new 
    end

    def edit
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.user_id = current_user.id


        respond_to do |format|
            if @restaurant.save
                format.html {redirect_to @restaurant, notice: 'Restaurant was successfully created.'}
                format.json { render :show, status: :created, location: @restaurant}
            else
                format.html {render :new }
                format.json {render json: @restaurant.errors, status: :unprocessable_entity }
            end
        end
    end


    def update
        respond_to do |format|
            if @restaurant.update(restaurant_params)
            format.html { redirect_to @restaurant, notice: 'Restaurant was successfuly updated.'}
            format.json { redner :show, status: :ok, location: @restaurant }
            else 
            format.html { render :edit }
            format.json { render json: @restaurant.errors, status: :unprocessable_entity}
            end
        end
    end


    def destroy 
        @restaurant.destroy
        respond_to do |format|
            format.html { redirect_to restaurants_url, notice: 'Restaurant was destoryed.'}
            format.json { head :no_content }
        end
    end




    private

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    


    def restaurant_params
        params.require(:restaurant).permit(:name, :description, :address, :phone_number, :picture, :menu, :latitude, :longitude, :user_id)
    end

        
end
