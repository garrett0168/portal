require 'rubygems'
require 'roo'

xlsx = Roo::Excelx.new("./files/report.xlsx")
# puts xlsx.info


# xlsx.default_sheet = xlsx.sheets[0]

# puts xlsx.sheets

# sheet=xlsx.default_sheet


# puts xlsx.last_row

$i=1
while $i<=xlsx.last_row  do
  # puts xlsx.row($i)
  xlsx.cell(1,1)
  $i +=1
end


xlsx.each(LoanNum: 'LoanNum', NMLSID: 'NMLSID', BorrName: 'BorrName', LOID: 'LOID', FundedDate: 'FundedDate' , TransactionType: 'TransactionType', PropAddress: 'PropAddress',MailingAddress: 'MailingAddress', LOName: 'LOName' ) do |hash|
  # puts hash.inspect
  $username= hash[:LOID]
  $loan= hash[:LoanNum]
  $borrower= hash[:BorrName]
  $funded= hash[:FundedDate]
  $type= hash[:TransactionType]
  $subject= hash[:PropAddress]
  $mailing= hash[:MailingAddress]
  # puts $loanNum
  puts $username
  if $username != 'LOID'
    puts DateTime.parse($funded.to_s).strftime('%m/%d/%Y')
    break;
  end
  # => { id: 1, name: 'John Smith' }
end



# puts xlsx.row($i)
# xlsx.cell(1,1)
# xlsx.cell('A',1)
# xlsx.cell(1,'A')
# xlsx.a1

# Access the second sheet's top-left cell.
#   xlsx.cell(1,'A',xlsx.sheets[1])