class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name, limit: 70, null: false
      t.integer :level, null: false
      t.string :school, null: false
      t.boolean :bard, default: false 
      t.boolean :cleric, default: false
      t.boolean :druid, default: false 
      t.boolean :paladin, default: false 
      t.boolean :ranger, default: false
      t.boolean :sorcerer, default: false 
      t.boolean :warlock, default: false
      t.boolean :wizard , default: false
      t.string :concentration, null: false
      t.string :description, limit: 4096, null: false
      t.timestamps
    end
       add_index(:spells, [:name], unique: true)
  end
end