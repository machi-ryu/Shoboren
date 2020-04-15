class AddAttendStateToJoins < ActiveRecord::Migration[5.2]
  def change
    add_column :joins, :attend_flg, :integer
  end
end
