class CreateConfigurations < ActiveRecord::Migration[5.1]
  def change
    drop_table :configurations
  end
end
