class CreateImports < ActiveRecord::Migration[5.0]
  def change
    create_table :imports do |t|
    	t.string :repo_name
    	t.string :owner
      t.timestamps
    end
  end
end
