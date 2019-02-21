class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:update]

  def new
    @applicant = Applicant.new
  end

  def index
    @applicants = Applicant.where(user: current_user)
  end

  def create
    @applicant = Applicant.new(applicant_params)
    @applicant.user = current_user
    if @applicant.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @applicant.update(applicant_params)
    check_zip_code(@applicant)
  end

  private

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :birth_place, :birth_date)
  end

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def check_zip_code(applicant)

      zip_codes =
        ["19053",
      "19057",
      "19059",
      "19061",
      "19055",
      "19063",
      "19057",
      "96047",
      "96049",
      "96050",
      "96052",
      "96146",
      "44135",
      "44137",
      "44139",
      "44369",
      "44379",
      "44388",
      "46045",
      "46047",
      "46049",
      "46117",
      "46119",
      "46145",
      "46147",
      "46149",
      "44787",
      "44789",
      "44791",
      "44879",
      "44892",
      "44894",
      "17033",
      "17034",
      "17036",
      "92637",
      "95030",
      "95032",
      "95028",
      "95444",
      "95445",
      "95447",
      "95448",
      "90402",
      "90403",
      "90408",
      "90482",
      "90489",
      "90491",
      "90475",
      "45127",
      "45128",
      "45130",
      "45356",
      "45357",
      "45359",
      "45879",
      "45881",
      "45883",
      "45896",
      "45897",
      "45899",
      "18055",
      "18057",
      "18059",
      "18147",
      "18181",
      "18182",
      "90762",
      "90763",
      "90765",
      "90766",
      "90768",
      "96450",
      "96482",
      "96237",
      "96465",
      "97421",
      "97422",
      "97424",
      "63739",
      "63741",
      "63743",
      "63840",
      "47051",
      "47053",
      "47055",
      "47259",
      "47269",
      "47279",
      "45657",
      "45659",
      "45661",
      "45663",
      "45665",
      "18435",
      "18437",
      "18439",
      "17489",
      "17491",
      "17493",
      "17498",
      "17509"]
    if zip_codes.include?(applicant.user.zip_code)
      redirect_to wrong_zip_code(@applicant)
    else
      redirect_to results_nineth_result_path(@applicant)
    end

  end

end
