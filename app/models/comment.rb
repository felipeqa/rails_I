class Comment < ApplicationRecord
  belongs_to :job
  validates_presence_of :body, :job_id, :name
end
