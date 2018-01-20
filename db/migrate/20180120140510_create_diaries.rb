class CreateDiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :diaries do |t|
      t.references :user, foreign_key: true
      t.float :weight

      t.timestamps
    end
  end
end
