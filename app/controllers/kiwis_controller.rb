class KiwisController < ApplicationController
    before_action :set_kiwi, only: %i[ show edit update destroy ]

    def index
        @kiwis = Kiwi.all
    end

    def show
    end

    def new
        @kiwi = Kiwi.new
    end

    def edit
    end

    def create
        @kiwi = Kiwi.new(kiwi_params)
        if @kiwi.save
            redirect_to @kiwi, notice: "Kiwi was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def update
        if @kiwi.update(kiwi_params)
            redirect_to @kiwi, notice: "Kiwi was successfully created."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @kiwi.destroy
        redirect_to kiwis_url, notice: "Kiwi was successfully created."
    end

    def set_kiwi
        @kiwi = Kiwi.find(params[:id])
    end

    def kiwi_params
        params.require(:kiwi).permit(:title,:body)
    end

end