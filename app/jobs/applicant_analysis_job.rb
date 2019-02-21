class ApplicantAnalysisJob < ApplicationJob
  queue_as :default

  def perform(applicant_id)
    applicant = Applicant.find(applicant_id)
    CSV.open("one_applicant.csv", "wb", csv_options) do |csv_row|
      csv_row << applicant.asylum ? 1 : 0
      csv_row << applicant.Arbeitserlaubnis? ? 1 : 0
      csv_row << applicant.living_obligation ? 1 : 0
      csv_row << applicant.application_date && app.application_date > (Time.now - 3.months) ?  1 : 0
      csv_row << applicant.safe_origin  ? 1 : 0
      csv_row << applicant.Berufsausbildung? || app.Abhängige_Beschäftigung?  ? 1 : 0
      csv_row << applicant.university_degree  ? 1 : 0
    end
  end
end
