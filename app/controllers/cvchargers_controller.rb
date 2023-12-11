class CvchargersController < ApplicationController
  def telecharger_cv
    cv_path = Rails.root.join('public', 'Adrien_Régis_CV.pdf')
    send_file cv_path, filename: 'Adrien_Régis_CV_cv.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def telecharger_cv_interim
    cv_path = Rails.root.join('public', 'CV_Adrien.pdf')
    send_file cv_path, filename: 'CV_Adrien_cv.pdf', type: 'application/pdf', disposition: 'inline'
  end
end
