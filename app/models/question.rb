class Question < ApplicationRecord
  belongs_to :section

  has_many :options, dependent: :destroy
  has_one :answe, dependent: :destroy

  #Estos los tipos de questions que tendra el atributo questions_type
  enum question_type: [:default, :text_free, :multiple, :level]
end
