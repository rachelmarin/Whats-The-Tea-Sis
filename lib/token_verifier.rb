# class TokenVerifier
#     include ActiveSupport::Configurable
#     include ActionController::RequestForgeryProtection

  
#     config.each_key do |configuration_name|
#       undef_method configuration_name
#       define_method configuration_name do
#         ActionController::Base.config[configuration_name]
#       end
#     end

#     def call(env)
#       @request = ActionDispatch::Request.new(env.dup)

#       unless verified_request?
#         raise ActionController::InvalidAuthenticityToken
#       end
#     end
  
#     private
#     attr_reader :request
#     delegate :params, :session, to: :request
#   end