require "test_helper"

class ScannerMailerTest < ActionMailer::TestCase
  test "results" do
    mail = ScannerMailer.results
    assert_equal "Results", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
