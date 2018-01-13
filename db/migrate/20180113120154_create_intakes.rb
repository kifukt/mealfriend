class CreateIntakes < ActiveRecord::Migration[5.1]
  def change
    create_table :intakes do |t|
      t.float :count

      t.timestamps
    end
  end
end
