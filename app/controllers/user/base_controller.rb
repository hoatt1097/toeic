class User::BaseController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'user/layouts/application'

  include User::SessionsHelper

  before_action :set_locale
  before_action :enforce_user_sign_in

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  private
  # I18n.locale をセットする
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
