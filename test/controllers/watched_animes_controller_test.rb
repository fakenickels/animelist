require 'test_helper'

class WatchedAnimesControllerTest < ActionController::TestCase
  setup do
    @watched_anime = watched_animes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:watched_animes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create watched_anime" do
    assert_difference('WatchedAnime.count') do
      post :create, watched_anime: { anime_id: @watched_anime.anime_id, user_id: @watched_anime.user_id }
    end

    assert_redirected_to watched_anime_path(assigns(:watched_anime))
  end

  test "should show watched_anime" do
    get :show, id: @watched_anime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @watched_anime
    assert_response :success
  end

  test "should update watched_anime" do
    patch :update, id: @watched_anime, watched_anime: { anime_id: @watched_anime.anime_id, user_id: @watched_anime.user_id }
    assert_redirected_to watched_anime_path(assigns(:watched_anime))
  end

  test "should destroy watched_anime" do
    assert_difference('WatchedAnime.count', -1) do
      delete :destroy, id: @watched_anime
    end

    assert_redirected_to watched_animes_path
  end
end
