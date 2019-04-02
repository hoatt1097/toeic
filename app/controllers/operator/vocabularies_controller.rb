class Operator::VocabulariesController < Operator::BaseController
  before_action :set_user_vocabulary, only: [:show, :edit, :update, :destroy]

  # GET /operator/vocabularies
  # GET /operator/vocabularies.json
  def index
    @user_vocabularies = User::Vocabulary.all
  end

  # GET /operator/vocabularies/1
  # GET /operator/vocabularies/1.json
  def show
  end

  # GET /operator/vocabularies/new
  def new
    @operator_vocabulary = User::Vocabulary.new
  end

  # GET /operator/vocabularies/1/edit
  def edit
  end

  # POST /operator/vocabularies
  # POST /operator/vocabularies.json
  def create
    @operator_vocabulary = User::Vocabulary.new(user_vocabulary_params)

    respond_to do |format|
      if @operator_vocabulary.save
        format.html { redirect_to @operator_vocabulary, notice: 'Vocabulary was successfully created.' }
        format.json { render :show, status: :created, location: @operator_vocabulary }
      else
        format.html { render :new }
        format.json { render json: @operator_vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operator/vocabularies/1
  # PATCH/PUT /operator/vocabularies/1.json
  def update
    respond_to do |format|
      if @operator_vocabulary.update(operator_vocabulary_params)
        format.html { redirect_to @operator_vocabulary, notice: 'Vocabulary was successfully updated.' }
        format.json { render :show, status: :ok, location: @operator_vocabulary }
      else
        format.html { render :edit }
        format.json { render json: @operator_vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operator/vocabularies/1
  # DELETE /operator/vocabularies/1.json
  def destroy
    @operator_vocabulary.destroy
    respond_to do |format|
      format.html { redirect_to operator_vocabularies_url, notice: 'Vocabulary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_vocabulary
      @user_vocabularies = User::Vocabulary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_vocabulary_params
      params.fetch(:operator_vocabulary, {})
    end
end
