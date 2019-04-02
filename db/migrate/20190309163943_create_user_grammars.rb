class CreateUserGrammars < ActiveRecord::Migration[5.0]
  def change
    create_table :user_grammars do |t|
      t.references :user_lessons, index: true, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
