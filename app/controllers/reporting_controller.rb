require 'roo'
require 'date'
class ReportingController < ApplicationController
def new
  end

  def report
    # xlsx = Roo::Excelx.new("./files/report.xlsx")
    # xlsx.each(LoanNum: 'LoanNum', NMLSID: 'NMLSID', BorrName: 'BorrName', LOID: 'LOID', FundedDate: 'FundedDate' , TransactionType: 'TransactionType', PropAddress: 'PropAddress',MailingAddress: 'MailingAddress', LOName: 'LOName' ) do |hash|
    #   # puts hash.inspect
    #   $username= hash[:LOID]
    #   $loan= hash[:LoanNum]
    #   $borrower= hash[:BorrName]
    #   $funded= hash[:FundedDate]
    #   $type= hash[:TransactionType]
    #   $subject= hash[:PropAddress]
    #   $mailing= hash[:MailingAddress]
    #   # puts $loanNum
    #   puts $username
    #   puts $username
    #
    #   if $username != 'LOID'
    #     @reporting = ReportingInformation.new(:username => $username, :loan => $loan , :borrower => $borrower, :funded =>  $funded , :type => $type, :subject => $subject , :mailing => $mailing)
    #
    #     @reporting.save
    #     break
    #   end
    # end

  end


def insert_report
  uploaded_io = params[:file][:file]
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
  end


  xlsx = Roo::Excelx.new("./public/uploads/"+ uploaded_io.original_filename )
  xlsx.each(LoanNum: 'LoanNum', NMLSID: 'NMLSID', BorrName: 'BorrName', LOID: 'LOID', FundedDate: 'FundedDate' , TransactionType: 'TransactionType', PropAddress: 'PropAddress',MailingAddress: 'MailingAddress', LOName: 'LOName' ) do |hash|
    # puts hash.inspect
    username= hash[:LOID]
    loan= hash[:LoanNum]
    borrower= hash[:BorrName]
    funded= hash[:FundedDate]
    type= hash[:TransactionType]
    subject= hash[:PropAddress]
    mailing= hash[:MailingAddress]
    # puts $loanNum
    # puts $username
    # puts $username

    if username != 'LOID'
      @reporting = ReportingInformation.new(:username => username, :loan => loan , :borrower => borrower, :funded =>  funded , :type => type, :subject => subject , :mailing => mailing)

      @reporting.save
      # break
    end


  end
  redirect_to 'reporting/report'
end

  def create
    @reporting = ReportingInformation.new(reporting_params)

    @reporting.save
    redirect_to 'reporting/new'
  end


  private
  def reporting_params
    params.require(:reporting).permit(:username, :loan, :borrower, :funded, :type, :subject, :mailing)
  end
end
