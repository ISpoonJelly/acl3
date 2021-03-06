class Api::FollowingsController < Api::BaseController
    #before_action :authenticate_user!
   
  def index
    respond_with @following = Following.where(:user => current_user)
  end 

  def new
  	@following = Following.new
	end
	  
	def create
    	@following = Following.new(:user => current_user, :follower_id => params[:follower])

      if @following.save
          render :status => "200", :json => {:status => "success"}.to_json
      else
          render :status => "400", :json => {:status => "failure"}.to_json
      end
	end

  def destroy
      @following = Following.where(:user_id => current_user, :follower_id => params[:follower])
      
      if @following.destroy
          render :status => "200", :json => {:status => "success"}.to_json
      else
          render :status => "400", :json => {:status => "failure"}.to_json
      end
  end
end