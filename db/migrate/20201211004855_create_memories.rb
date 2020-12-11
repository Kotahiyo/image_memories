class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.json :image
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
