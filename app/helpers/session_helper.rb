module SessionHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.present?
  end

  def request_sign_in
    unless signed_in?
      flash[:error] = "店を投稿していただくといいねできるようになります！"
      redirect_to root_path
    end
  end
end