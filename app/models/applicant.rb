class Applicant < ApplicationRecord

  enum residence_status: { Arbeitserlaubnis: 0, Gestattung: 1, Duldung: 2 }
  enum occupation_type: { Praktikum: 0, Freiwilligendienst: 1, Berufsausbildung: 2, Abhängige_Beschäftigung: 3 }
  enum gender: { male: 0, female: 1, other: 2 }

  belongs_to :user
end

