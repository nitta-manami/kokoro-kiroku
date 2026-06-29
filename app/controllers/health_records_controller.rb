class HealthRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
      @health_records = current_user.health_records
                        .order(created_at: :desc)
  end

  def new
    @health_record = HealthRecord.new
  end

  def create
    @health_record = current_user.health_records.new(health_record_params)

    if @health_record.save
      redirect_to home_path, notice: "体調を記録しました🌸"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def health_record_params
    params.require(:health_record).permit(:content)
  end
end
