class AddInternshipLengthToApplicant < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :internship_length, :string
  end
end
