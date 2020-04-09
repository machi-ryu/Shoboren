class AddSankaflgToJoins < ActiveRecord::Migration[5.2]
  def change
    add_column :joins, :sanka_flg, :integer
  end
end
