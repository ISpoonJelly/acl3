class Api::CommentsController < Api::BaseController
    #before_action :authenticate_user!
    
    def new
    	@comment = Comment.new
  	end
	  
    def create
      @comment = Comment.new(:text => params[:text], :user => current_user, :post_id => params[:post_id])
      @post = Post.find(params[:post_id])

    	if @comment.save
        current_user.comments << @comment
        @post.commentCount += 1
        @post.save
        current_user.comments << @comment
        render :status => "200", :json => {:status => "success"}.to_json
      else
        render :status => "400", :json => {:status => "failure"}.to_json
      end
    end

end