class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.String :name
      t.text :description

      t.timestamps
    end
  end
end
