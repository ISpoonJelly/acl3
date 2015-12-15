class Api::PostsController < Api::BaseController
    before_action :authenticate_user!, only: [:create]
    
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
    	@post = Post.create(:user => current_user, :body => params[:body])
        @user = User.find_by_id(params[:destination])
        unless @user.nil?
            User.find(params[:destination]).destination_posts << @post
        end
        current_user.posts << @post

    	respond_with @post
	end

protected
  def post_params
    params.require(:post).permit(:body, :destination)
  end
end