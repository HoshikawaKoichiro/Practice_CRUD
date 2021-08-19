class NovelsController < ApplicationController
    before_action :set_novel, only: %i[ show edit update destroy ]

    def index
        @novels = Novel.all
    end
    
    def show
    end

    def new
        @novel = Novel.new
    end

    def edit
    end

    def create
        @novel = Novel.new(novel_params)
        if @novel.save
            redirect_to @novel, notice: "Novel was successfully created."
        else
            render :new, status: unprocessable_entity
        end
    end

    def update
        if @novel.update(novel_params)
            redirect_to @novel, notice: "Novel was successfully updated."
        else
            render :edit, status: unprocessable_entity
        end
    end

    def destroy
        @novel.destroy
          redirect_to novels_url, notice: "Novel was successfully destroyed."
    end

    def set_novel
        @novel = Novel.find(params[:id])
    end

    def novel_params
        params.require(:novel).permit(:title, :body)
    end
end