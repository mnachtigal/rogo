class Review < ActiveRecord::Base
  belongs_to :rental
  belongs_to :user

  validates :overall, presence: true  

end
