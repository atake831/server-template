class Api::BoardsController < Api::ApplicationController
  before_action :set_board, only: [:show, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      render :show, status: :created
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  def update
    if @board.update(board_params)
      render :show, status: :ok
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:title, :text)
    end
end
