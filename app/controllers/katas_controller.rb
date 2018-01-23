class KatasController < ApplicationController
  def index
    @katas = Kata.all
    render :index
  end

  def show
    @kata = Kata.find(params[:id])
    render :show
  end
end
