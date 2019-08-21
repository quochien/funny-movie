class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :youtube_url, null: false
      t.references :user

      t.timestamps
    end
  end
end
