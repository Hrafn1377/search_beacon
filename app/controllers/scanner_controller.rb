class ScannerController < ApplicationController

  def index
  end

  def check
    url = params[:url]
    email = params[:email]

    if url.blank?
      flash[:alert] = "Please enter a URL."
      redirect_to scanner_path and return
    end

    response = Faraday.post(
      "http://localhost:8000/scan",
      { url: url }.to_json,
      "Content-Type" => "application/json"
    )

    if response.success?
      @result = JSON.parse(response.body)
      @url = url

      if email.present?
        ScannerMailer.results(email, url, @result).deliver_now
        @email_sent = true
      end
    else
      flash[:alert] = "Something went wrong. Please try again."
      redirect_to scanner_path
    end
  rescue => e
    flash[:alert] = "Could not reach the scanner service."
    redirect_to scanner_path
  end
end