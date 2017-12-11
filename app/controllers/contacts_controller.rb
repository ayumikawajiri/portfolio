class ContactsController < ApplicationController
  def new
  	@classified = Classified.find(params[:classified_id])
    @contact = Contact.new
  end
 
  def create
  	@classified = Classified.find(params[:classified_id])
    @contact = Contact.new(contact_params)
    @contact.classified_id = @classified.id
    
    if params[:back]
      render :new
    elsif @contact.save
      MailSenderMailer.inquiry(@contact).deliver 
      redirect_to [@contact.classified.city, @contact.classified], notice: 'Inquiry was successfully created.'
    else
      render :new
    end
  end

  def confirm
    if request.post?
      @classified = Classified.find(params[:classified_id])
      @contact = Contact.new(contact_params)
      @contact.classified_id = @classified.id
    else
      @contact = Contact.find(params[:id])
      @contact.attributes = contact_params
    end
    if @contact.valid?
      render :action => 'confirm'
    else
      render :action => request.post? ? 'new' : 'edit'
    end
  end
 
    private
    def contact_params
      params.require(:contact).permit(:email, :name, :message, :classified_id)
    end
end
