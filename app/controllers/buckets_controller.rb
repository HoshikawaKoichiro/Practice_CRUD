class BucketsController < ApplicationController
    before_action :set_bucket, only: %i[ show edit update destroy ]

    def index
      @buckets = Bucket.all 
    end

    def show
    end

    def new
        @bucket = Bucket.new
    end

    def edit
    end

    def create
        @bucket = Bucket.new(bucket_params)
        if @bucket.save
            redirect_to @bucket, notice: "Bucket was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @bucket.update(bucket_params)
            redirect_to @bucket, notice: "Bucket was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @bucket.destroy
        redirect_to buckets_url, notice: "Bucket was successfully destroyed."
    end
    
    def set_bucket
        @bucket = Bucket.find(params[:id])
    end

    def bucket_params
        params.require(:bucket).permit(:title, :body)
    end


end
