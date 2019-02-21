class AddApplicationDateToApplicant < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :application_date, :date
  end
end
