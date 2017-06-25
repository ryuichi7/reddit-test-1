class Api::V1::SubRedditPostsController < ApplicationController
  before_action :set_sub_reddit_post, only: [:show, :edit, :update, :destroy]

  # GET /sub_reddit_posts
  # GET /sub_reddit_posts.json
  def index
    render json: SubRedditPost.all
  end

  # GET /sub_reddit_posts/1
  # GET /sub_reddit_posts/1.json
  def show
  end

  # GET /sub_reddit_posts/new
  def new
    @sub_reddit_post = SubRedditPost.new
  end

  # GET /sub_reddit_posts/1/edit
  def edit
  end

  # POST /sub_reddit_posts
  # POST /sub_reddit_posts.json
  def create
    @sub_reddit_post = SubRedditPost.new(sub_reddit_post_params)

    respond_to do |format|
      if @sub_reddit_post.save
        format.html { redirect_to @sub_reddit_post, notice: 'Sub reddit post was successfully created.' }
        format.json { render :show, status: :created, location: @sub_reddit_post }
      else
        format.html { render :new }
        format.json { render json: @sub_reddit_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_reddit_posts/1
  # PATCH/PUT /sub_reddit_posts/1.json
  def update
    respond_to do |format|
      if @sub_reddit_post.update(sub_reddit_post_params)
        format.html { redirect_to @sub_reddit_post, notice: 'Sub reddit post was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_reddit_post }
      else
        format.html { render :edit }
        format.json { render json: @sub_reddit_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_reddit_posts/1
  # DELETE /sub_reddit_posts/1.json
  def destroy
    @sub_reddit_post.destroy
    respond_to do |format|
      format.html { redirect_to sub_reddit_posts_url, notice: 'Sub reddit post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_reddit_post
      @sub_reddit_post = SubRedditPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_reddit_post_params
      params.fetch(:sub_reddit_post, {})
    end
end
