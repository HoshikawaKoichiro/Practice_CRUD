class BridgesController < ApplicationController
    before_action :set_bridge, only: %i[ show edit update destroy ]

    def index
        @bridges = Bridge.all
    end

    def show
    end

    def new
        @bridge = Bridge.new
    end

    def edit
    end

    def create
        @bridge = Bridge.new(bridge_params)
        if @bridge.save
            redirect_to @bridge, notice: "Bridge was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @bridge.update(bridge_params)
            redirect_to @bridge, notice: "Bridge was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @bridge.destroy
        redirect_to bridges_url, notice: "Bridge was successfully destroyed."
    end

    def set_bridge
        @bridge = Bridge.find(params[:id])
    end

    def bridge_params
        params.require(:bridge).permit(:title,:body)
    end

end