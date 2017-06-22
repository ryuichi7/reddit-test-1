class Api::V1::SubRedditCommentsController < ApplicationController
  before_action :set_sub_reddit_comment, only: [:show, :edit, :update, :destroy]

  # GET /sub_reddit_comments
  # GET /sub_reddit_comments.json
  def index
    @sub_reddit_comments = SubRedditComment.all
  end

  # GET /sub_reddit_comments/1
  # GET /sub_reddit_comments/1.json
  def show
  end

  # GET /sub_reddit_comments/new
  def new
    @sub_reddit_comment = SubRedditComment.new
  end

  # GET /sub_reddit_comments/1/edit
  def edit
  end

  # POST /sub_reddit_comments
  # POST /sub_reddit_comments.json
  def create
    @sub_reddit_comment = SubRedditComment.new(sub_reddit_comment_params)

    respond_to do |format|
      if @sub_reddit_comment.save
        format.html { redirect_to @sub_reddit_comment, notice: 'Sub reddit comment was successfully created.' }
        format.json { render :show, status: :created, location: @sub_reddit_comment }
      else
        format.html { render :new }
        format.json { render json: @sub_reddit_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_reddit_comments/1
  # PATCH/PUT /sub_reddit_comments/1.json
  def update
    respond_to do |format|
      if @sub_reddit_comment.update(sub_reddit_comment_params)
        format.html { redirect_to @sub_reddit_comment, notice: 'Sub reddit comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_reddit_comment }
      else
        format.html { render :edit }
        format.json { render json: @sub_reddit_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_reddit_comments/1
  # DELETE /sub_reddit_comments/1.json
  def destroy
    @sub_reddit_comment.destroy
    respond_to do |format|
      format.html { redirect_to sub_reddit_comments_url, notice: 'Sub reddit comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_reddit_comment
      @sub_reddit_comment = SubRedditComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_reddit_comment_params
      params.fetch(:sub_reddit_comment, {})
    end
end
