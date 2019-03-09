module Operator::SessionsHelper

  def enforce_operator_sign_in
    unless operator_signed_in?
      flash[:error] = 'Please sign in.'
      redirect_to operator_sign_in_path
    end
  end

  def operator_sign_in(user)
    session[:operator_user_id] = user.id
  end

  def operator_signed_in?
    current_operator_user.present?
  end

  def current_operator_user
    if session[:operator_user_id]
      @current_operator_user ||= Operator::User.find_by(id: session[:operator_user_id])
    end
  end
  def operator_sign_out
    session.delete(:operator_user_id)
    @current_operator_user = nil
  end

end
