class Api::UsersController < Api::BaseController

	def index 
		respond_with @users = User.all
	end

	def show
		respond_with @user_posts = User.find(params[:id])
	end


end