class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :tweets, :post, :content
 
  end
end