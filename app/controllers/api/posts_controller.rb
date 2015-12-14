class Api::PostsController < Api::BaseController
    #before_action :authenticate_user!
    
    def index
        respond_with @post = Post.all
    end
    
    def show
        respond_with @post = Post.find(params[:id])
    end

    def new
    	@post = Post.new
  	end
	  
	def create
    	@post = Post.create(post_params)
        current_user.posts << @post

    	respond_with @post
	end

protected
  def post_params
    params.require(:post).permit(:body, :tags, :likes)
  end
end