class Admin::IncomeStatementsController < Admin::StatementsController
  def create
    @statement = IncomeStatement.new(statement_params)

    if @statement.save
      redirect_to admin_statement_path(@statement), notice: "#{I18n.t('activerecord.models.statement')} 创建成功."
    else
      render :new
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def statement_params
      params.require(:income_statement).permit(:price, :content, :type)
    end
end
