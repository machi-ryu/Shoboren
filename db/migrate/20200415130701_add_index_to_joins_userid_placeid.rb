class AddIndexToJoinsUseridPlaceid < ActiveRecord::Migration[5.2]
  def change
    add_index :joins, [:user_id, :place_id], unique: true
  end
end
