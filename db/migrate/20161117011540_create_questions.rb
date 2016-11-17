class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :body
      t.boolean :resolved

      t.timestamps null: false
    end
  end
end
