class User::Lesson < ApplicationRecord
  has_many :user_vocabularies, :class_name => 'User::Vocabulary',foreign_key: :user_lessons_id, inverse_of: :user_lesson, dependent: :destroy
  has_many :user_grammars, :class_name => 'User::Grammar', foreign_key: :user_grammars_id, inverse_of: :user_lesson, dependent: :destroy
  has_many :user_exercises, :class_name => 'User::Exercise', foreign_key: :user_exercises_id, inverse_of: :user_lesson, dependent: :destroy
end
