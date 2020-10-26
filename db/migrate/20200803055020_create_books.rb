class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, limit: 70, null: false
      t.timestamps
    end
       add_index(:books, [:name], unique: true)
  end
end
