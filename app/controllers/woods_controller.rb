class WoodsController < ApplicationController
    before_action :set_wood, only: %i[ show edit update destroy ]

    def index
        @woods = Wood.all 
    end

    def show
    end

    def new
        @wood = Wood.new
    end

    def edit
    end

    def create
        @wood = Wood.new(wood_params)
        if @wood.save
            redirect_to @wood, notice: "Wood was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @wood.update(wood_params)
            redirect_to @wood, notice: "Wood was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @wood.destroy
        redirect_to woods_url, notice: "Wood was successfully destroyed."
    end

    def set_wood
        @wood = Wood.find(params[:id])
    end

    def wood_params
        params.require(:wood).permit(:title, :body)
    end

end