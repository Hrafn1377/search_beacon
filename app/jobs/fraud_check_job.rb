class FraudCheckJob < ApplicationJob
  queue_as :default

  def perform(job_id)
    job = Job.find(job_id)
    return unless job.present?

    response = Faraday.post(
      "http://localhost:8000/check",
      { title: job.title, company: job_company, description: job.description }.to_json,
      "Content-Type" => "application/json"
    )

    if response.success?
      result = JSON.parse(response.body)
      score = result["score"]

      job.update(
        fraud_score: score,
        status: score >= 10 ? "pending" : "active",
        verified_at: score < 10 ? Time.current : nil
      )
    end
  rescue => e
    Rails.logger.error "FraudCheckJob failed for job #{job_id}: #{e.message}"
  end
end