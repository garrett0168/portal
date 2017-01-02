class EmailRequestMailer < ActionMailer::Base
  default from: "Commerge Home Mortgage <noreply@commercehomemortgage.com>"
  default subject: "Email Request from Retail Portal website"
  layout 'mailer'

  def notify(email_request)
    @email_request = email_request
    mail(to: "marketing@commercemtg.com", bcc: ["Richard Young <richard.j.young@gmail.com>"])
    #mail(to: "richard.j.young@gmail.com")
  end
end
