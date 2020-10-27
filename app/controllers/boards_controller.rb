class BoardsController < ApplicationController
    before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
    def index
        @boards = Board.all
    end

    def show
        @board = Board.find (params[:id])
    end

    def new
        # @boards = current_user.board.build
        @boards = current_user.boards.build
        # @board = Board.new
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
          redirect_to board_path(@board) 
        else
          render :new
        end
        # @board = current_user.boards(board_params)
        #  if @board.save
        #    redirect_to.board_path(@board)
        #  else
        #     render :new
        #  end
    end
    
    end
    private
    def board_params
        params.require(:board).permit(:title, :content)
    end
    


