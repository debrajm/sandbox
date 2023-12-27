class ApplicationController < ActionController::API
	before_action :authenticate

	def authenticate

		if request.headers["Authorization"]
			begin
				auth_header = request.headers["Authorization"]
				decode_token = JWT.decode(token, secret)		
				payload = decode_token.first
				user_id = payload["user_id"]
				@users = User.find(user_id)
			rescue => e
				render json: {message: "Error:#{e}"}, status: :forbidden
			end
		else
			render json: {message: "No Authorization header sent"}, status: :forbidden
		end
	end

	def secret
		secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
	end

	def token
		auth_header.split(" ")[1]
	end

	def create_token(payload)
		JWT.encode(payload, secret)
	end
end
