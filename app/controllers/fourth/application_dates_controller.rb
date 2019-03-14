class Fourth::ApplicationDatesController < ApplicationController
  skip_before_action :authenticate_user!, raise: false

  def question
    @applicant = Applicant.find(params[:id])
  end

  def answer
    @applicant = Applicant.find(params[:id])
    redline_date = Date.new(2015,8,31)
    @applicant.update(applicant_params)
    raise
      if (@applicant.application_date > redline_date) && @applicant.safe_origin
        redirect_to unsuccessful_fourth_application_date(@applicant) # declined - no chance!
      elsif (@applicant.application_date < Date.today - 3.months) && (@applicant.application_date > Date.today - 4.years)
        redirect_to question_fifth_residence_status_path(@applicant)
      elsif @applicant.application_date > Date.today - 3.months
        redirect_to choose_other_path(@applicant) # WAIT 3 MONTHS
      elsif @applicant.application_date < Date.today - 4.years
        redirect_to success_path(@applicant)
      end
  end

  def unsuccessful
    @header = "During the asylum procedure the applicant is not allowed to work"
    @message = ""
    render layout: "wait_layout"
  end

  private

  def applicant_params
    params.require(:applicant).permit(:application_date)
  end
end
