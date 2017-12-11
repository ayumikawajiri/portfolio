class MailSenderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_sender_mailer.inquiry.subject
  #
  def inquiry(contact)
    @contact = contact
    mail to: contact.classified.user.email,
    	 reply_to:  contact.email,
    	 subject: "You've got an inquiry through Classifieds AUS"
  end
end
