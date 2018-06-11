class CommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.build(comment_params)
    @comment.save
    redirect_to @job
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
