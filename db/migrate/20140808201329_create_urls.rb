class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :table_row
      t.string :obfuscated_id
    end
  end
end
