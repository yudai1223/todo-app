class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
        @board = Board.find(params[:board_id])
        @tasks = @board.tasks.all
    end

    def show
        board = Board.find(params[:board_id])
        @task = board.tasks.find(params[:id])
     
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
        @task = board.tasks.find(params[:id])
    end    

    def update
        # board = Board.find(params[:board_id])
        @task = Tasks.find(params[:id])
        @task.update(task_params)
        redirect_to board_task_path(@task)
    end

    def destroy
        board = Board.find(params[:board_id])
        task = board.tasks.find(params[:id])
        task.destroy!
        redirect_to board_tasks_path
    end
  private
  def task_params
    params.require(:task).permit(:title, :content, :eyecatch).merge(user_id: current_user.id)
  end

end