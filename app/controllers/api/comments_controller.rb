class Api::CommentsController < Api::BaseController
    #before_action :authenticate_user!
    
    def new
    	@comment = Comment.new
  	end
	  
    def create
      @comment = Comment.new(comments_params)
      @post = Post.find(params[:postId])

    	if @comment.save
        @post.comments << @comment
        @post.commentCount += 1
        current_user.comments << @comment
        respond_with @post
        # render :status => "200", :json => {:status => "success"}.to_json
      else
        render :status => "400", :json => {:status => "failure"}.to_json
      end
    end

protected
  def comments_params
    params.require(:comment).permit(:text, :post_id, :user_id)
  end
end