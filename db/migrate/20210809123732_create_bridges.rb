class CreateBridges < ActiveRecord::Migration[6.1]
  def change
    create_table :bridges do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
