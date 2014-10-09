class ChangeColumnName < ActiveRecord::Migration
  def change 
  	rename_column :reviews,     :review,   :thoughts
  end
end
