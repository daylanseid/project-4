class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :send_404

  def send_404(e)
    render json: { message: e.message }, status: :not_found
  end
end