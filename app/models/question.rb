class Question < ApplicationRecord
  validates :name, presence: true
  validate :validate_name_not_including_comma
  
  belong_to :user

end
