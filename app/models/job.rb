class Job < ApplicationRecord
  has_many :comments
  scope :mos_recent, order('created_at DESC')
  validates_presence_of :description, :title
end
