class AddUserIdToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_reference :applicants, :user, foreign_key: true
  end
end
