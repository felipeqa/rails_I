class AddJobIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :job_id, :integer
    add_index :job_id, :comments
  end
end
