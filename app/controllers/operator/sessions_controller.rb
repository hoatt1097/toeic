class Operator::SessionsController < Operator::BaseController
  layout 'operator/layouts/login'
  skip_before_action :enforce_operator_sign_in
  def index
  end

  def create
    user = Operator::User.find_by_nickname(params[:session][:nickname])

    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Wellcome back !!'
      operator_sign_in user
      redirect_to operator_users_path
    else
      flash.now[:error] = "Invalid UserID or password!"
      render action: :new
    end
  end

  def destroy
    operator_sign_out if operator_signed_in?
    redirect_to '/', success: "Signed out!"
  end
end
