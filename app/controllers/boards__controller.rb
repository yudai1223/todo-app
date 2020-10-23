class BoardsController < ApplicationController
    before_action :authenticate_user!

    def index
        @boards = Board.all
    end

    def show
        @board = Board.find(params[:id])
    end

    def new
        @board = current_user.boards.build
        @boards = current_user.boards.build
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
        redirect_to board_path(@board) ,notice:'保存したよ'
        else
            flash.now[:error] ='保存に失敗したよ'
            render :new
        end
        end

        private
        def board_params
            params.require(:board).permit(:title, :content, :eyecatch)
        end
    end   

