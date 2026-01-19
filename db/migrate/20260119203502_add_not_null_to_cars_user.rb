class AddNotNullToCarsUser < ActiveRecord::Migration[8.0]
  def change
    change_column_null :cars, :user_id, false, false
  end
end
