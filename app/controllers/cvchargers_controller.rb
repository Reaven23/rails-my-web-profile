class CvchargersController < ApplicationController
  def telecharger_cv
    cv_path = Rails.root.join('public', 'Adrien_cv_fs.pdf')
    send_file cv_path, filename: 'Adrien_cv_fs_cv.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def telecharger_cv_interim
    cv_path = Rails.root.join('public', 'CV_Adrien.pdf')
    send_file cv_path, filename: 'CV_Adrien_cv.pdf', type: 'application/pdf', disposition: 'inline'
  end
end
