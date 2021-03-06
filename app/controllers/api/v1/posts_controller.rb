class Api::V1::PostsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, :only => [:create, :update, :destroy]

  def index
    render json: Post.includes(:comments).all.order('created_at DESC').to_json(include: :comments)
  end

  def create
    post = current_user.posts.build(post_params)
    post.save
    render json: post.to_json(include: :comments)
  end

  def destroy
    Post.destroy(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes(post_params)
    render json: post.to_json(include: :comments)
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
