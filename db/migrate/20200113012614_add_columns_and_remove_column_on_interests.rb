class AddColumnsAndRemoveColumnOnInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :label, :string
    add_column :interests, :value, :string
    remove_column :interests, :name
  end
end
