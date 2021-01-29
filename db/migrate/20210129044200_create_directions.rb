class CreateDirections < ActiveRecord::Migration[6.1]
  def change
    create_table :directions do |t|
      t.text :step
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
