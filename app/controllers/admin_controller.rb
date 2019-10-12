class AdminController < ApplicationController
  before_action :check_authentication
  layout 'admin'
  
  private
    def check_authentication
      unless session[:is_login]
        flash[:danger] = '请先登录'
        redirect_to new_admin_sessions_path
      end
    end
end