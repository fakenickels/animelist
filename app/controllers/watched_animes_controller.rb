class WatchedAnimesController < ApplicationController
  before_action :set_watched_anime, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @watched_animes = WatchedAnime.where(user_id: current_user.id)
    respond_with(@watched_animes)
  end

  def show
    respond_with(@watched_anime)
  end

  def new
    
      @watched_anime = current_user.watched_animes.build
      respond_with(@watched_anime)

  end

  def edit
  end

  def create
    respond_to do |format|
      if current_user.watched_animes.where(anime_id: watched_anime_params[:anime_id]).empty?
        @watched_anime = current_user.watched_animes.build(watched_anime_params)
        @watched_anime.save
        
        format.html { redirect_to watched_animes_path, notice: "Anime adicionado a lista com sucesso" }
      else
        format.html { redirect_to watched_animes_path, notice: "Este anime já está adicionado." }
      end
    end
  end

  def update
    @watched_anime.update(watched_anime_params)
    respond_with(@watched_anime)
  end

  def destroy
    @watched_anime.destroy
    respond_with(@watched_anime)
  end

  private
    def set_watched_anime
      @watched_anime = WatchedAnime.find(params[:id]).where(user_id: current_user.id)
    end

    def watched_anime_params
      params.require(:watched_anime).permit(:anime_id)
    end
end
