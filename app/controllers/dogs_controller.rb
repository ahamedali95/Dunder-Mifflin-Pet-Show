class DogsController < ApplicationController
  before_action :get_dog, only: [:show, :edit, :destroy, :update]

  def index
    @dogs = Dog.all
    @sorted = Dog.sort_dogs
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create

  end

  def edit
  end

  def update
  end

  private

  def get_dog
    @dog = Dog.find(params[:id])
  end
end
