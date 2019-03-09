class User::SessionsController < User::BaseController
  layout 'user/layouts/login'
  skip_before_action :enforce_user_sign_in
  def new
  end

  def create
    user = User::User.find_by_nickname(params[:session][:nickname])

    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Wellcome back !!'
      user_sign_in user
      redirect_to user_homes_path
    else
      flash.now[:error] = "Invalid UserID or password!"
      render action: :new
    end
  end

  def destroy
    user_sign_out if user_signed_in?
    redirect_to '/', success: "Signed out!"
  end
end
