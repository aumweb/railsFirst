class RenameFiledCategoryTableDiscription < ActiveRecord::Migration[5.2]
  def change
  	rename_column :categories,:discription, :description
  end
end
