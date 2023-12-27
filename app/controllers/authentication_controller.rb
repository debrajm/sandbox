class AuthenticationController < ApplicationController

	skip_before_action :authenticate, only: [:login]

	def login
		@user = User.where(email: params[:email]).last
		if @user
			if(@user.authenticate(params[:password]))
				payload = {user_id: @user.id}
				secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
      			token = create_token(payload)
      			render json: { email: @user.email }
			else
				render json: {message: "Authentication failed"}
			end
		else
			render json: {message: "Invalid User!"}
		end
	end
end
