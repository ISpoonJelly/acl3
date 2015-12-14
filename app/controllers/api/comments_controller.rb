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
        current_user.comments << @comment

      	if @comment.save
        render :status => "200", :json => {:status => "success"}.to_json
      else
        render :status => "400", :json => {:status => "failure"}.to_json
      end
    end

protected
  def comments_params
    params.require(:comment).permit(:text)
  end
end