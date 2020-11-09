class TasksController < ApplicationController
    before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

    def index
        @tasks = Task.all
    end

    def show
        # board = board.find(params[:board_id])
        @tasks = current_user.tasks.find(params[:id])
      
    end
    
    def new
        @tasks = current_user.tasks.build
    end

    def create
        @tasks = current_user.tasks(task_params)
        @task.save
    end

  private
  def tasks_params
    params.require(:task).permit(:title, :content)
  end

end