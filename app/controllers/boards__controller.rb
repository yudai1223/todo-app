class BoardsController < ApplicationController
    def index
        @boards = Board.all
    end

    def show
        @board = Board.find(params[:id])
    end

    def new
        @board = current_user.boards.build
        @boards= current_user.boards.build
    end
end