class CreateUserExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :user_exercises do |t|
      t.references :user_lessons, index: true, foreign_key: true
      t.string :question, :null => false
      t.string :answer, :null => false
      t.string :answer_wrong

      t.timestamps
    end
  end
end
