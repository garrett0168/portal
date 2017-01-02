class EmailRequest < ActiveRecord::Base
  validates :name, :lo_name, :email, :event_date, :who_to_send_to, :subject_line, :desired_goal, :detailed_description, presence: true

  after_create :email_marketing

  private

  def email_marketing
    begin
      EmailRequestMailer.notify(self).deliver!
    rescue => e
      Rails.logger.error("Unable to send email request to marketing. Error: #{e.message}")
      Rails.logger.error(e.backtrace)
    end
  end
end
