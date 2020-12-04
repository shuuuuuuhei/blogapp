class CreateRelationsips < ActiveRecord::Migration[6.0]
  def change
    create_table :relationsips do |t|
      t.references :following, null: false, foreign_key: { to_table: :users}
      t.references :follower, null: false, foreign_key: { to_table: :users}
      t.timestamps
    end
  end
end
