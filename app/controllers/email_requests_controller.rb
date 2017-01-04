class EmailRequestsController < ApplicationController
  respond_to :html, :json

  def create
    @email_request = EmailRequest.create(post_params)
    respond_with(@email_request)
  end

  private

  def post_params
    params.require(:email_requests).permit(:name, :lo_name, :email, :event_date, :who_to_send_to, :subject_line, :desired_goal, :detailed_description, :frequency_and_time_of_day, :existing_query, :exclusions, :preheader_text, :category)
  end
end
