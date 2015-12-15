class Api::UsersController < Api::BaseController

	def new
	    @user = User.new
	end

	def show
		respond_with @user = User.find(params[:id])
	end
	  
	def create
		@user = User.create(user_params)

		if @user.save
		  render :status => "200", :json => {:status => "success"}.to_json
		else
		  render :status => "400", :json => {:status => "failure"}.to_json
		end
	end
    
protected
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end