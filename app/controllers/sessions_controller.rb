class SessionsController < Devise::SessionsController
    include Devise::Controllers::Helpers
    respond_to :json

    private

    def respond_with(resource, _opts = {})
        if resource.valid_password?(params[:user][:password])
        render json: {
        status: {
        code: 200, 
        message: 'Logged in successfully'
        },
        data: resource.as_json(only: [:jti, :email])
        } 
        else
        render json: {
        status: {
        code: 401, 
        message: 'Invalid email or password'
        }
        }, status: :unauthorized
        end
    end 

    def respond_to_on_destroy(resource, _opts = {})
        render json: {
        status: {
        code: 200,
        message: 'Logged out successfully'
        }
        }
    end

    #def respond_to_on_destroy(resource, _opts = {:jti, :email})
    #    jwt_payload = request.env['warden-jwt_auth.token']
     #   jti = jwt_payload['jti']
     #   Devise::JWT::RevocationStrategies::JTIMatcher.new.blacklist(jti)
      #  render json: {
      #  status: {
      #  code: 200,
     #   message: 'Logged out successfully'
      #  }
     #   }
 #   end
end