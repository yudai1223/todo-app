class BoardsController < ApplicationController


    def index
        @boards = Board.all
    end

    def show
        @board = Board.find(params[:id])
    end

    def new
        @board = current_user.boards.build  #サインインしているユーザーを取得
        @boards = current_user.boards.build
    end

    def create
        @board = Board.new(board_params)
         if @board.save
           redirect_to.board_path(@board)
         else
            render :new
         end
    end

    private
    def board_params
        params.require(:board).permit(:title, :content)
    end
end

