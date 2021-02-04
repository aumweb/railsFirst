class CreateCategoryTable < ActiveRecord::Migration[5.2]
  def change
    create_table :category do |t|
    	t.string :title
    	t.text :discription
    end
  end
end
