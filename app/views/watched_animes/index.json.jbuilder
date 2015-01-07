json.array!(@watched_animes) do |watched_anime|
  json.extract! watched_anime, :id, :user_id, :anime_id
  json.url watched_anime_url(watched_anime, format: :json)
end
