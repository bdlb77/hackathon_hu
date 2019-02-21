class AddUniversityDegreeToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :university_degree, :boolean
  end
end
