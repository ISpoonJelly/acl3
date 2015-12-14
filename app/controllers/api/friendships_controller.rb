class Api::FriendshipsController < Api::BaseController
    #before_action :authenticate_user!
    
    def new
    	@friendship = Friendship.new
  	end
	  
    def create
      
      
      if @friendship.save
        render :status => "200", :json => {:status => "success"}.to_json
      else
        render :status => "400", :json => {:status => "failure"}.to_json
      end
    end

protected
  def friendships_params
    params.require(:friendship).permit(:friend_id)
  end
end