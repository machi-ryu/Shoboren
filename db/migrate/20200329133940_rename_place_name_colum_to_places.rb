class RenamePlaceNameColumToPlaces < ActiveRecord::Migration[5.2]
  def change
    rename_column :places, :place_name, :name
  end
end
