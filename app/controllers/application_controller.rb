class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :authenticate_user!

  #include Pundit
  protect_from_forgery :with => :exception

  before_action :set_user_language

  def set_user_language
    I18n.locale = 'pt-BR'
  end

end
