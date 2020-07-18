class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :user_id, :integer
  end
end
