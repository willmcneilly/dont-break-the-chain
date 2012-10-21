class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.boolean :complete
      t.timestamp :completedat
      t.string :timespent
      t.text :information

      t.timestamps
    end
  end
end
