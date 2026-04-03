# Preview all emails at http://localhost:3000/rails/mailers/scanner_mailer
class ScannerMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/scanner_mailer/results
  def results
    ScannerMailer.results
  end
end
