class CreatePockets < ActiveRecord::Migration[6.1]
  def change
    create_table :pockets do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
