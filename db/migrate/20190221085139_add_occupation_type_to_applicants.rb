class AddOccupationTypeToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :occupation_type, :integer
  end
end
