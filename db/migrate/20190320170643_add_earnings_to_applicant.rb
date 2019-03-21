class AddEarningsToApplicant < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :earnings, :string
  end
end
