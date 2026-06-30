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

  def edit
    @health_record = current_user.health_records.find(params[:id])
  end

  def update
    @health_record = current_user.health_records.find(params[:id])

    if @health_record.update(health_record_params)
      redirect_to health_records_path, notice: "体調の記録を更新しました🌸"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @health_record = current_user.health_records.find(params[:id])

    @health_record.destroy

    redirect_to health_records_path, notice: "体調の記録を削除しました🌸"
  end

  private

  def health_record_params
    params.require(:health_record).permit(:content)
  end
end
