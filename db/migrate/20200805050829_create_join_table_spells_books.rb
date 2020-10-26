class CreateJoinTableSpellsBooks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :spells, :books do |t|
      # t.index [:spell_id, :book_id]
      t.index [:book_id, :spell_id], unique: true
    end
  end
end
