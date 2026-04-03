class ScannerMailer < ApplicationMailer
  def results(email, url, result)
    @url = url
    @result = result
    @score = result["score"]
    @verdict = result["verdict"]
    @flags = result["flags"]

    mail(
      to: email,
      subject: "SearchBeacon Scan Results — #{@verdict == 'clean' ? '✓ Looks Clean' : '⚠ Red Flags Found'}"
    )
  end
end