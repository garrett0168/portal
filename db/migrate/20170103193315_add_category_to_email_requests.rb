class AddCategoryToEmailRequests < ActiveRecord::Migration
  def change
    add_column :email_requests, :category, :string
  end
end
