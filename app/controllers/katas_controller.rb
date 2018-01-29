class KatasController < ApplicationController

  before_action :set_kata, only: [:edit, :update, :destroy, :show ]

  def index
    @katas = Kata.all
  end

  def edit
    render :edit
  end

  def update
    if @kata.update(kata_params)
      flash[:notice] = 'Kata updated!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to edit kata!'
      render :edit
    end
  end

  def destroy
    @kata.destroy
    redirect_to root_path
  end

  def show
    render :show
  end

  def new
    @kata = Kata.new
  end

  def create
    @kata = Kata.new(kata_params)
    if @kata.save
      flash[:notice] = 'Kata created!'
      redirect_to kata_path(@kata.id)
    else
      flash[:error] = 'Failed to create kata!'
      render :new
    end
  end

  private

  def kata_params
    params.require(:kata).permit(:title, :description) #.permit(:name, :price, :old_price, :short_description, :full_description)
  end

  def set_kata
    @kata = Kata.find(params[:id])
  end
end
