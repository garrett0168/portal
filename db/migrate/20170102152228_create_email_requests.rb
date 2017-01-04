class CreateEmailRequests < ActiveRecord::Migration
  def change
    create_table :email_requests do |t|
      t.string :name
      t.string :lo_name
      t.string :email
      t.string :event_date
      t.string :who_to_send_to
      t.string :frequency_and_time_of_day
      t.boolean :existing_query
      t.text :exclusions
      t.string :subject_line
      t.string :preheader_text
      t.text :desired_goal
      t.text :detailed_description

      t.timestamps
    end
  end
end
