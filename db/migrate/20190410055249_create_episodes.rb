class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :description
      t.integer :duration
      t.references :serie, foreign_key: true
      t.integer :progress

      t.timestamps
    end
  end
end
