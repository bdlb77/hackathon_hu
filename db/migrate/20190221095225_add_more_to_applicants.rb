class AddMoreToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :first_name, :string
    add_column :applicants, :last_name, :string
    add_column :applicants, :gender, :integer
    add_column :applicants, :birth_date, :date
    add_column :applicants, :birth_place, :string
  end
end
