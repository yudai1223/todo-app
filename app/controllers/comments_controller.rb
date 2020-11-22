class CommentsController < ApplicationController

    def new
        task = Task.find(params[:task_id])
        @comment = task.comments.build
    end
 
    def create
        task = Task.find(params[:task_id])
        @comment = task.comments.build(comment_params)
        @comment.save!
        redirect_to board_task_path(@task)
        end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end


