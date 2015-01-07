class CreateWatchedAnimes < ActiveRecord::Migration
  def change
    create_table :watched_animes do |t|
      t.references :user, index: true
      t.references :anime, index: true

      t.timestamps
    end
  end
end
