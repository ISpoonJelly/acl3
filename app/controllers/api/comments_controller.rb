class Api::CommentsController < Api::BaseController
    #before_action :authenticate_user!
    
    def new
    	@comment = Comment.new
  	end
	  
    def create
        @comment = Comment.create(comments_params)
        @post = Post.find(params[:postId])
        @post.comments << @comment
        @post.commentCount += 1

      	respond_with @post
    end

protected
  def comments_params
    params.require(:comment).permit(:text)
  end
end