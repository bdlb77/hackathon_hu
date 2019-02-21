class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.boolean :asylum
      t.integer :residence_status

      t.timestamps
    end
  end
end
