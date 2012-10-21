class CreateChains < ActiveRecord::Migration
  def change
    create_table :chains do |t|
      t.string :name
      t.integer :days
      t.timestamp :start
      t.text :information
      t.boolean :active

      t.timestamps
    end
  end
end
