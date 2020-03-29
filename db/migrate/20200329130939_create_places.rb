class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :place_name
      t.timestamp :stime
      t.timestamp :etime
      t.text :menu
      t.string :intention_state

      t.timestamps
    end
  end
end
