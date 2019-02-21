class AddSafeOriginToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :safe_origin, :boolean
    add_column :applicants, :origin_state, :string
  end
end
