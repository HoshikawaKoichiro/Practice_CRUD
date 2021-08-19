class ComicsController < ApplicationController
    before_action :set_comic, only: %i[ show edit update destroy ]
    
    def index
        @comics = Comic.all
    end

    def show
    end

    def new
        @comic = Comic.new
    end

    def edit
    end

    def create
        @comic = Comic.new(comic_params)

        if @comic.save
            redirect_to @comic, notice: "Comic was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @comic.update(comic_params)
            redirect_to @comic, notice: "Comic was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @comic.destroy
          redirect_to comics_url, notice: "Comic was successfully destroyed."
    end

    def set_comic
        @comic = Comic.find(params[:id])
    end

    def comic_params
        params.require(:comic).permit(:title, :body)
    end
end