class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :deadline_at
      t.string :priority
      t.string :status
      t.string :label

      t.timestamps
    end
  end
end
