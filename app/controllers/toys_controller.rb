class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.new(toy_params)

    if toy.save
      render json: toy, status: :created
    else
      render json: toy.errors, status: :unprocessable_entity
    end
  end

  def update
    toy = Toy.find_by(id: params[:id])

    if toy.update(toy_params)
      render json: toy
    else
      render json: toy.errors, status: :unprocessable_entity
    end
  end

  def destroy
    toy = Toy.find_by(id: params[:id])

    if toy.destroy
      head :no_content
    else
      render json: { error: 'Failed to donate toy' }, status: :unprocessable_entity
    end
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
