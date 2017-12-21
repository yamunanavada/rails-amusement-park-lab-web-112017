class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    # byebug
    # @user = @attractions.users
  end

  def show
    @user = User.find(params[:id])
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    #come back to this for log in stuff
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      flash[:error] = @attraction.errors.full_messages
      redirect_to new_attraction_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])

  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      flash[:error] = @attraction.errors.full_messages
      redirect_to edit_attraction_path(@attraction)
    end

  end

  def delete
    @attraction = Attraction.find(params[:id])
    @attraction.destroy
    redirect_to attractions_path
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end



end
