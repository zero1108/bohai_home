class Admin::ContactsController < AdminController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  
  # GET /contacts
  def index
    @q = Contact.ransack(params[:q])
    @contacts = @q.result.page(params[:page])
  end

  # GET /contacts/1
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to admin_contact_path(@contact), notice: "#{I18n.t('activerecord.models.contact')} 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      redirect_to admin_contact_path(@contact), notice: "#{I18n.t('activerecord.models.contact')} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to admin_contacts_url, notice: "#{I18n.t('activerecord.models.contact')} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:email, :phone, :content)
    end
end
