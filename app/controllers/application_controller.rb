class ApplicationController < ActionController::Base
  before_action :store_user_location, if: :storable_location?

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  def storable_location?
    non_html_response = sign_out_path
    public_page = _process_action_callbacks.none? { |p| p.filter == :authenticate_user! }

    request.get? && is_navigational_format? && !request.xhr? && !public_page && !non_html_response
  end

  def store_user_location
    path = params[:referrer].presence || request.fullpath

    store_location_for(:user, path)
  end
end
