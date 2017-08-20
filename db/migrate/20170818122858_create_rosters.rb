class CreateRosters < ActiveRecord::Migration[5.1]
  def change
    create_table :rosters do |t|
      t.string :player_name
      t.integer :player_class
      t.string :thumbnail_link
      t.integer :role
      t.boolean :hidden, default: false

      t.timestamps
    end
    add_index :rosters, :player_name, unique: true
    add_index :rosters, :hidden
  end
end
