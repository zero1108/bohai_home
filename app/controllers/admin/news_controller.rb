class Admin::NewsController < AdminController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  
  # GET /news
  def index
    @q = News.ransack(params[:q])
    @news = @q.result.page(params[:page])
  end

  # GET /news/1
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to admin_news_path(@news), notice: "#{I18n.t('activerecord.models.news')} 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /news/1
  def update
    if @news.update(news_params)
      redirect_to admin_news_path(@news), notice: "#{I18n.t('activerecord.models.news')} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /news/1
  def destroy
    @news.destroy
    redirect_to admin_news_index_url, notice: "#{I18n.t('activerecord.models.news')} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def news_params
      params.require(:news).permit(:title, :content, :state)
    end
end
