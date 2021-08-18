class PostsController < SecuredController
  skip_before_action :authorize_request, only: %i[index show]
  def index
    posts = Post.all
    render json: posts
  end

  def show
    post = Post.find(params[:id])
    render json: post, include: [:user]
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def create
    post = Post.create!(post_params)
    render json: post, status: :created
  end

  def destroy
    post = Post.find(params[:id])
    post.delete
    head :no_content
  end

  private

  def post_params
    params.permit(:body, :title, :sub)
  end
end
