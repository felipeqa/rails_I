class CommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.build(comment_params)

    if sucess = @comment.save
      CompanyMailer.new_comment(@job, @comment).deliver
    end

    respond_to do |format|
      format.html do
        if sucess
          flash[:notice] = "Comment was created with sucess!"
        else
          flash[:alert] = "Please Fill in all fields to create a comment."
        end
        redirect_to @job
      end
      format.js
    end
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
