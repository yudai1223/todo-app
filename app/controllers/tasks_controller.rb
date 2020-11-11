class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
        @board = Board.find(params[:board_id])
        @tasks = Task.all
    end

    def show
        @task = current_user.tasks.build
        @tasks = current_user.tasks.find(params[:id])
    end

    def new
        
        board = Board.find(params[:board_id])
        binding.pry
        @task = board.tasks.build
      
        # @tasks = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(task_params)
        @task.save!
    end

  private
  def task_params
    params.require(:task).permit(:title, :content)
  end

end