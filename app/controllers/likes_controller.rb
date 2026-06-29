class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @health_record = HealthRecord.find(params[:health_record_id])

    current_user.likes.create!(health_record: @health_record)

    redirect_to public_health_records_path,
                notice: "応援しました🌸"
  end

  def destroy
    @health_record = HealthRecord.find(params[:health_record_id])

    current_user.likes.find_by!(health_record: @health_record).destroy

    redirect_to public_health_records_path,
                notice: "応援を取り消しました🌸"
  end
end
