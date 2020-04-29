module HttpAuthConcern  
  extend ActiveSupport::Concern
  included do
      before_action :http_authenticate
  end
  def http_authenticate
    
      authenticate_or_request_with_http_basic do |username, password|
          username == ENV['AUTH_USERNAME'].to_s && password == ENV['AUTH_PASSWORD'].to_s
      end
  end
end