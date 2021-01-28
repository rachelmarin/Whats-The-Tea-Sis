class CreateEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :equipments do |t|
      t.string :tool
      t.integer :recipe_id

      t.timestamps
    end
  end
end
