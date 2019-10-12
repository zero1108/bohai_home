class Admin::SessionsController < AdminController

  layout false
  skip_before_action :check_authentication

  def new
  end

  def create
    if authenticate
      session[:is_login] = true 
      redirect_to admin_root_path
    else
      flash[:danger] = '用户名或密码错误'
      redirect_to new_admin_sessions_path
    end
  end

  def destroy
    session[:is_login] = false
    redirect_to new_admin_sessions_path
  end

  private
    def session_params
      params.permit(:name, :password)
    end

    def authenticate
      return session_params[:name] == USER_NAME && session_params[:password] == USER_SECRET
    end
end