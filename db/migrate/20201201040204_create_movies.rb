class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :movieId
      t.string :title
      t.string :director
      t.string :release_date
      t.text :description
      t.integer :thumbs_up
      t.integer :thumbs_down
      t.string :poster

      t.timestamps
    end
  end
end
