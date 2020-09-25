class MakeUniqColumns < ActiveRecord::Migration[6.0]
  def change
  	change_column :usuarios, :email, :string, unique: true
  	change_column :usuarios, :RFC, :string, unique: true
  end
end
