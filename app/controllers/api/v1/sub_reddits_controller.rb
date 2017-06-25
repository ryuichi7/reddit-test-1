class Api::V1::SubRedditsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    sub_reddit = SubReddits::Create.new(title: params[:title]).call

    if sub_reddit
      render json: { message: 'success' }, status: :created
    else
      render json: { message: 'error'}, status: :unprocessable_entity
    end
  end
end
