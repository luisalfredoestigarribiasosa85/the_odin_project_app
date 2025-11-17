class AddPhoneNumberToCars < ActiveRecord::Migration[8.0]
  def change
    add_column :cars, :phone_number, :string, limit: 25
  end
end
