class ChangeRelationsipToRelationshipObjects < ActiveRecord::Migration[6.0]
  def change
    rename_table :relationsips, :relationships
  end
end
