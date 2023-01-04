class AddVehicleImageToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :vehicle_image, :string
  end
end
