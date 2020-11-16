class BoardsController < ApplicationController
    before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
    def index
        @boards = Board.all
    end

    def show
        @board = Board.find (params[:id])
        @board = current_user.boards.find (params[:id])
    end

    def new
        # @boards = current_user.board.build
        @board = current_user.boards.build
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
    
    def edit
        @boards = current_user.boards.find(params[:id])
    end
    
    def update
        @board = current_user.boards.find(params[:id])
        @board.update(board_params)
        redirect_to board_path(@board)
    end

    def destroy
        board = current_user.boards.find(params[:id])
        board.destroy!
        redirect_to root_path
    end

    end
    private
    def board_params
        params.require(:board).permit(:title, :content)
    end
    


