class CreateReportingInformations < ActiveRecord::Migration
  def change
    create_table :reporting_informations do |t|
      t.string :username
      t.string :loan
      t.string :borrower
      t.date :funded
      t.string :type
      t.string :subject
      t.string :mailing

      t.timestamps null: false
    end
  end
end
