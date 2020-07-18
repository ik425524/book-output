class Text < ApplicationRecord
  validates :text, {presence: true}
  validates :title, {presence: true,length: {maximum: 100}}
  belongs_to :user
end
