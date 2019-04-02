class User::Vocabulary < ApplicationRecord
  belongs_to :user_lesson, :class_name => 'User::Lesson', inverse_of: :user_vocabularies
end
