class CvchargersController < ApplicationController
  def telecharger_cv
    cv_path = Rails.root.join('public', 'Adrien_Régis_CV.pdf') # Chemin vers votre CV
    send_file cv_path, filename: 'Adrien_Régis_CV_cv.pdf', type: 'application/pdf', disposition: 'inline'
  end
end
