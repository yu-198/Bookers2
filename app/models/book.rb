class Book < ApplicationRecord
	belongs_to :user
	#相手が一人の場合belong_to user一人一人に対してidは一人だから
	 validates :title, presence: true
  validates :body, length: { maximum: 200 }, presence: true
end
