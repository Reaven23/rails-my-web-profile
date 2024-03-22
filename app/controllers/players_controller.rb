class PlayersController < ApplicationController
  def index
    @players = Player.all
    render json: @players
  end

  def list
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    render json: @player
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save!
      flash[:notice] = "Le joueur a été créé avec succès !"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      flash[:notice] = "Le joueur a été modifié avec succès !"
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :birth_year, :points_record, :photo, :level, :category)
  end
end
end
