class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :name
      t.text :description
      t.integer :episodes
      t.string :rating

      t.timestamps
    end
  end
end
