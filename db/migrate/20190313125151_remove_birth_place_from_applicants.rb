class RemoveBirthPlaceFromApplicants < ActiveRecord::Migration[5.2]
  def change
    remove_column :applicants, :birth_place
  end
end
