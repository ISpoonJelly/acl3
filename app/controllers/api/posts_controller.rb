class Api::PostsController < Api::BaseController
    #before_action :authenticate_user!
    
    def index
        respond_with @post = Post.all
    end
    
    def show
        respond_with @post = Post.find(params[:id])
    end
end