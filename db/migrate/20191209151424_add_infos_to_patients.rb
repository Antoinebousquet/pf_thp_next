class AddInfosToPatients < ActiveRecord::Migration[5.2]
  def change
  	add_column :patients, :treatment, :integer
    add_column :patients, :city, :string
    add_column :patients, :sexe, :string
    add_column :patients, :birth, :datetime
    add_column :patients, :phone, :string
  end
end
