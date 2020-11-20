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
      redirect_to board_tasks_path(@task)
    end
    
    def edit
        board = Board.find(params[:board_id])
        @tasks =board.tasks.find(params[:id])
        binding.pry
    end

    def update
        
    end
  private
  def task_params
    params.require(:task).permit(:title, :content, :eyecatch).merge(user_id: current_user.id)
  end

end