class AddInternshipMandatoryToApplicant < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :internship_mandatory, :boolean
  end
end
