json.array!(@animes) do |anime|
  json.extract! anime, :id, :name, :description, :episodes, :rating
  json.url anime_url(anime, format: :json)
end
