class Api::PostsController < Api::BaseController
    #before_action :authenticate_user!

    def create 

    end
    
    def index
        respond_with @post = Post.all
    end
    
    def show
        respond_with @post = Post.find(params[:id])
    end

    def method_name
    	
    end
end