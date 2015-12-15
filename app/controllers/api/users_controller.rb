class Api::UsersController < Api::BaseController
	before_action :authenticate_user!, only: [:show]

	def index
		@user = current_user
		respond_with @user
	end

	def new
	    @user = User.new
	end

	def show
		respond_with @user = User.find(params[:id])
	end
	  
	def create
        puts "the password is -> " + params[:password]
		@user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])

		if @user.save!
		  render :status => "200", :json => {:status => "success"}.to_json
		else
		  render :status => "400", :json => {:status => "failure"}.to_json
		end
	end
end