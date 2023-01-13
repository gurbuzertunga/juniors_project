class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :text
      t.string :creator
      t.references :product

      t.timestamps
    end
  end
end
