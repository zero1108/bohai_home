class Admin::StatementsController < AdminController
  before_action :set_statement, only: [:show, :edit, :update, :destroy]
  before_action :set_class, only: [:new, :create]    
  # GET /statements
  def index
    @q = Statement.ransack(params[:q])
    @statements = @q.result.page(params[:page])
  end

  # GET /statements/1
  def show
  end

  # GET /statements/new
  def new
    @statement = set_class.new
  end

  # GET /statements/1/edit
  def edit
  end

  # POST /statements
  def create
    @statement = set_class.new(statement_params)

    if @statement.save
      redirect_to admin_statement_path(@statement), notice: "#{I18n.t('activerecord.models.statement')} 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /statements/1
  def update
    if @statement.update(statement_params)
      redirect_to admin_statement_path(@statement), notice: "#{I18n.t('activerecord.models.statement')} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /statements/1
  def destroy
    @statement.destroy
    redirect_to admin_statements_url, notice: "#{I18n.t('activerecord.models.statement')} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statement
      @statement = Statement.find(params[:id])
    end

    def set_class
      (params[:type] || statement_params[:type]) == 'income' ? IncomeStatement : OutcomeStatement
    end

    # Only allow a trusted parameter "white list" through.
    def statement_params
      params.require(:statement).permit(:price, :content, :type)
    end
end
