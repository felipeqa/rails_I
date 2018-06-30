class Comment < ApplicationRecord
  belongs_to :job, counter_cache: true
  validates_presence_of :body, :job_id, :name
end
