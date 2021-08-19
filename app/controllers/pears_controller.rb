class PearsController < ApplicationController
    before_action :set_pear, only: %i[ show edit update destroy ]

    def index
        @pears = Pear.all
    end

    def show
    end
    
    def new
        @pear = Pear.new
    end

    def edit
    end

    def create
        @pear = Pear.new(pear_params)
        if @pear.save
            redirect_to @pear, notice: "Pears was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if  @pear.update(pear_params)
            redirect_to @pear, notice: "Pears was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end    

    def destroy
        @pear.destroy
        redirect_to pears_url, notice: "Pears was successfully destroyed."
    end

    def set_pear
        @pear = Pear.find(params[:id])
    end

    def pear_params
        params.require(:pear).permit(:title, :body)
    end

end