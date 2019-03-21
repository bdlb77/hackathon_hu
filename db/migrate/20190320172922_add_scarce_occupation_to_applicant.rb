class AddScarceOccupationToApplicant < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :scarce_occupation, :boolean
  end
end
