class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :content
      t.date :due_date
      t.boolean :completed, default: false
      t.belongs_to :employee, foreign_key: true
      t.belongs_to :supervisor, foreign_key: true

      t.timestamps
    end
  end
end