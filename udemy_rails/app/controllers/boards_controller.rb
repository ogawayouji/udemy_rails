class BoardsController < ApplicationController
    before_action :set_target_board, only: %i[show edit update destroy]

    def index
        @board = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all 
        # tag_id のものがあれば　それのみ表示　なければ　全て表示
        @boards = @board.page(params[:page]) # Board
        # 中身が参照されないかぎり、dbへアクセスされない
        # pageに繋ぐことで件数を制限
    end
    def new
        @board = Board.new(flash[:board])
        # binding.pry
    end
    def create
        board = Board.new(board_params)
        if board.save
        
            flash[:notice] = "「#{board.title}」の掲示板を作成しました"
            redirect_to board
        else
            redirect_to new_board_path, flash: {
                board: board,
                error_messages: board.errors.full_messages
            }
        end
        #binding.pry
    end

    def show
        @comment = Comment.new(board_id: @board.id)
        #@comment = @board.comments.new
        #@board = Board.find(params[:id])
        #binding.pry
    end

    def edit
        #@board = Board.find(params[:id])
    end

    def update
        #board = Board.find(params[:id])
        if @board.update(board_params)

            redirect_to @board
        else
            redirect_to :back, flash: { 
                board: @board,
                error_messages: @board.errors.full_messages
            }
            #flash[:notice] = ''
        end
    end

    def destroy
        #board = Board.find(params[:id])
        @board.destroy #delete

        redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました"}
    end
    private

    def board_params
        params.require(:board).permit(:name,:title,:body, tag_ids: []) # タグの追加 []=配列
    end

    def set_target_board
        @board = Board.find(params[:id])
    end 
end