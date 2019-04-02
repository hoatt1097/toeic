class Operator::UsersController < Operator::BaseController
  before_action :set_operator_user, only: [:show, :edit, :update, :destroy]

  # GET /operator/users
  # GET /operator/users.json
  def index
    @operator_users = Operator::User.all
  end

  # GET /operator/users/1
  # GET /operator/users/1.json
  def show
  end

  # GET /operator/users/index
  def new
    @operator_user = Operator::User.new
  end

  # GET /operator/users/1/edit
  def edit
  end

  # POST /operator/users
  # POST /operator/users.json
  def create
    @operator_user = Operator::User.new(operator_user_params)

    respond_to do |format|
      if @operator_user.save
        format.html { redirect_to @operator_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @operator_user }
      else
        format.html { render :new }
        format.json { render json: @operator_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operator/users/1
  # PATCH/PUT /operator/users/1.json
  def update
    respond_to do |format|
      if @operator_user.update(operator_user_params)
        format.html { redirect_to @operator_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @operator_user }
      else
        format.html { render :edit }
        format.json { render json: @operator_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operator/users/1
  # DELETE /operator/users/1.json
  def destroy
    @operator_user.destroy
    respond_to do |format|
      format.html { redirect_to operator_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operator_user
      @operator_user = Operator::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operator_user_params
      params.fetch(:operator_user, {})
    end
end
