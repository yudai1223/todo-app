class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.references :users
        t.string :title , null
        t.text :content
        t.timestamps
    end
  end
end
