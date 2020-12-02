class CreateCostumes < ActiveRecord::Migration[6.0]
  def change
    create_table :costumes do |t|
      t.string :role
      t.string :description
      t.boolean :finished, default: false
      t.boolean :authentic
      t.integer :user_id
      t.integer :actor_id

      t.timestamps
    end
  end
end
