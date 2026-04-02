class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_employer!, only: [:new, :create, :edit, :update]
  before_action :set_job, only: [:show, :edit, :update]

  def index
    @jobs = Job.active.not_expired.order(created_at: :desc)
  end

  def show
  end

  def new
    @job = current_user.jobs.build
  end

  def create
  @job = current_user.jobs.build(job_params)
  @job.status = "pending"

  if @job.save
    FraudCheckJob.perform_later(@job.id)
    redirect_to @job, notice: "Job posted and submitted for verification."
  else
    render :new, status: :unprocessable_entity
  end
end

  def edit
    redirect_to jobs_path, alert: "Not authorized." unless @job.user == current_user
  end

  def update
    if @job.user == current_user && @job.update(job_params)
      redirect_to @job, notice: "Job updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def require_employer!
    redirect_to root_path, alert: "Only employers can post jobs." unless current_user.employer?
  end

  def job_params
    params.require(:job).permit(
      :title, :company, :description, :location, :remote,
      :experience_level, :work_authorization, :language,
      :salary_min, :salary_max, :expires_at
    )
  end
end