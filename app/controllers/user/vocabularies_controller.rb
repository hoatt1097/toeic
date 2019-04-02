class User::VocabulariesController < User::BaseController
  require 'json'

  def index
    @lesson = User::Lesson.all
  end

  def get_vocabulary_by_lesson
    lesson_id = params[:sltLesson]
    arr_vocabulary = Array.new
    vocabularies = User::Lesson.find(params[:sltLesson]).user_vocabularies
    vocabularies.each do |vocabulary|
      arr_vocabulary.push(
          "word": "#{vocabulary.word}",
          "mean": "#{vocabulary.mean}"
      )
    end
    render json: {
      sltLesson: lesson_id,
      arrVocabulary: arr_vocabulary
    }
  end

end
