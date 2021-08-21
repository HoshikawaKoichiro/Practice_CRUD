class PastasController < ApplicationController
    before_action :set_pasta, only: %i[show edit update destroy]

    def index
        @pastas = Pasta.all
    end

    def show
    end

    def new
        @pasta = Pasta.new
    end

    def edit
    end

    def create
        @pasta = Pasta.new(pasta_params)
        if @pasta.save
              redirect_to pasta_path(@pasta), notice: "パスタは無事作成されました"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @pasta.update(pasta_params)
            redirect_to @pasta, notice: "Pasta was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @pasta.destroy
        redirect_to pastas_url, notice: "Pasta was successflly destroyed."
    end

    def set_pasta
        @pasta = Pasta.find(params[:id])
    end

    def pasta_params
        params.require(:pasta).permit(:title,:body)
    end
end