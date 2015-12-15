class Api::PostsController < Api::BaseController
    before_action :authenticate_user!, only: [:create]
    
    def index
        if params[:destination].nil?
            @post = Post.all
        else
            @post = Post.where(:destination_id => params[:destination])
        end
        
        respond_with @post
    end
    
    def show
        respond_with @post = Post.find(params[:id])
    end

    def new
    	@post = Post.new
  	end
	  
	def create
        @destination_user = nil
        unless params[:destination].nil?
            @destination_user = User.find(params[:destination])
        end
    	@post = Post.create(:user => User.first, :body => params[:body], :destination => @destination_user)
    	respond_with @post
	end
end