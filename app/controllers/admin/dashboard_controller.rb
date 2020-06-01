class Admin::DashboardController < AdminController

  # GET /comments
  # GET /comments.json
  def index
  	current_time = Time.now
  	@result = Statement.where(created_at: current_time.at_beginning_of_month..current_time).group(:type).sum(:price)
  	@income = @result["IncomeStatement"]
  	@outcome = @result["OutcomeStatement"]
  end

end
