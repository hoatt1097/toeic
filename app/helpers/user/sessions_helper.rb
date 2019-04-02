module User::SessionsHelper
  def enforce_user_sign_in
    unless user_signed_in?
      flash[:error] = 'Please sign in.'
      redirect_to user_sign_in_path
    end
  end

  def user_sign_in(user)
    session[:user_user_id] = user.id
  end

  def user_signed_in?
    user_operator_user.present?
  end

  def user_operator_user
    if session[:user_user_id]
      @current_user_user ||= User::User.find_by(id: session[:user_user_id])
    end
  end

  def user_sign_out
    session.delete(:user_user_id)
    @current_user_user = nil
  end

  # Returns the current signed in user (if any)
  def current_user
    if session[:user_user_id]
      @current_user ||= User::User.find_by(id: session[:user_user_id])
    end
  end

  def lesson
    User::Lesson.all
  end
end
