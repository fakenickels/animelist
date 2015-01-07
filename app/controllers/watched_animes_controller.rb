class WatchedAnimesController < ApplicationController
  before_action :set_watched_anime, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @watched_animes = WatchedAnime.all
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
    @watched_anime = current_user.watched_animes.build(watched_anime_params)
    @watched_anime.save
    respond_with(@watched_anime)
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
      @watched_anime = WatchedAnime.find(params[:id])
    end

    def watched_anime_params
      params.require(:watched_anime).permit(:anime_id)
    end
end
