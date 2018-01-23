class MakeChangesToProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :title, :name  
    change_column :products, :description, :text 
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 8, scale: 2 
    remove_column :products, :isbn, :string 
    add_column :products, :stock, :integer
    add_column :products, :on_sale, :boolean, default: false 
  end
end
