class ApplicationController < ActionController::Base
  respond_to :html, :json
  protect_from_forgery with: :exception
  after_filter :set_csrf_cookie_for_ng

  def index
  end

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end
end
