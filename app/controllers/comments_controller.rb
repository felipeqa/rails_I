class CommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment was created with sucess!"
    else
      flash[:alert] = "Please Fill in all fields to create a comment."
    end
    redirect_to @job
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.job, notice: "Comment destroyed with sucess!"
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
