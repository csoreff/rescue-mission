class Question < ActiveRecord::Base
  belongs_to :user

  validates :title, length: { minimum: 40 }
  validates :description, length: { minimum: 150 }
end