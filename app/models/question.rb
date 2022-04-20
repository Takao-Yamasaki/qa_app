class Question < ApplicationRecord
  validates :title, presence: true
  # validate :validate_name_not_including_comma
  
  belongs_to :user

end
