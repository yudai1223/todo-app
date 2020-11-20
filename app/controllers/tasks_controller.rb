class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
        @board = Board.find(params[:board_id])
        @tasks = Task.all
         
       
    end

    def show
        @board = Board.find(params[:board_id])
        @task =  Task.find(params[:id])
        
    end

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build

        # @tasks = current_user.tasks.build
    end

    def create
      board = Board.find(params[:board_id])
      @task = board.tasks.build(task_params)
      @task.save!
    end

  private
  def task_params
    params.require(:task).permit(:title, :content).merge(user_id: current_user.id)
  end

end