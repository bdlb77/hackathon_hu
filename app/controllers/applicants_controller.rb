class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:update]

  def new
        @nations = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"]

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
