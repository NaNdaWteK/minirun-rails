class KatasController < ApplicationController
  def index
    @kata = Kata.all.first
    render :index
  end

  def show
    @kata = Kata.all.first
    render :show
  end
end
