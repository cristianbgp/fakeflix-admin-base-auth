class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :rating
      t.integer :duration
      t.integer :price
      t.integer :status
      t.integer :progress

      t.timestamps
    end
  end
end
