class KatasController < ApplicationController
  def index
    @katas = Kata.all
  end

  def edit
    @kata = Kata.find(params[:id])
  end

  def update
    @kata = Kata.find(params[:id])
    if @kata.update_attributes(kata_params)
      flash[:notice] = 'Kata updated!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to edit kata!'
      render :edit
    end
  end

  def destroy
    @kata = Kata.find(params[:id])
    @kata.destroy
    redirect_to root_path
  end

  def show
    @kata = Kata.find(params[:id])
  end

  def new
    render :new
  end

  def create
    kata = Kata.new(title: params[:title], description: params[:description])
    if kata.save
      redirect_to kata_path(kata.id)
    else
      render :new
    end
  end

  def kata_params
    params.require(:kata).permit(:title, :description) #.permit(:name, :price, :old_price, :short_description, :full_description)
  end
end
