class CreateCalculations < ActiveRecord::Migration[5.1]
  def change
    create_table :calculations do |t|
      t.decimal :amount
      t.text :list
      t.integer :user_id

      t.timestamps
    end
  end
end
