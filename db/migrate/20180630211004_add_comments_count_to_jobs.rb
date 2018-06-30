class AddCommentsCountToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :comments_count, :integer, default: 0
  end
end
