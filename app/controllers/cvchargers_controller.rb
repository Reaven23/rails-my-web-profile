class CvchargersController < ApplicationController
  def telecharger_cv
    cv_path = Rails.root.join('public', 'CV_ADRIEN_REGIS_FS.pdf')
    send_file cv_path, filename: 'CV_ADRIEN_REGIS_FS_cv.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def telecharger_cv_interim
    cv_path = Rails.root.join('public', 'CV_Adrien.pdf')
    send_file cv_path, filename: 'CV_Adrien_cv.pdf', type: 'application/pdf', disposition: 'inline'
  end
end
