class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/:id
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST "lists"
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE "lists/:id"
  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
