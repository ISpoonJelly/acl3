class Api::FollowingsController < Api::BaseController
    #before_action :authenticate_user!
    
  def new
  	@following = Following.new
	end
	  
	def create
    	@following = Following.new(:user_id => current_user, :follower_id => params[:follower])

      if @following.save
          render :status => "200", :json => {:status => "success"}.to_json
      else
          render :status => "400", :json => {:status => "failure"}.to_json
      end
	end

  def destroy
      @following = Following.where(:user_id => current_user, :follower_id => params[:follower])
      @following.destroy
  end

protected
  def following_params
    params.require(:following).permit(:follower)
  end
end