class RemoveUserInterestsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_interests
  end
end
