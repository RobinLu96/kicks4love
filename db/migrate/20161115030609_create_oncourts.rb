class CreateOncourts < ActiveRecord::Migration[5.0]
  def change
    create_table :oncourts do |t|
      t.string :title
      t.text :content
      t.string :image
      t.timestamps
    end
  end
end
