class CreateUserVocabularies < ActiveRecord::Migration[5.0]
  def change
    create_table :user_vocabularies do |t|
      t.references :user_lessons, index: true, foreign_key: true
      t.string :word, :null => false
      t.string :mean, :null => false
      t.string :word_type
      t.string :synonym
      t.string :antonyms

      t.timestamps
    end
  end
end
