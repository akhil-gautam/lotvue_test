class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  
  def pretty_response(result, status_code)
    response, status = result, status_code
    render json: response, status: status and return
  end
end
