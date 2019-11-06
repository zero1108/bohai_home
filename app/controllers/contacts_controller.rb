class ContactsController < ApplicationController
  
  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      @message =  "感谢您咨询博海教育，请等待回复~"
      @type = :success
    else
      @message = "#{@contact.errors.full_messages.join(',')}"
      @type = :danger
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:name, :phone, :grade, :content)
    end
end
