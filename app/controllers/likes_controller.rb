class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @health_record = HealthRecord.find(params[:health_record_id])

    current_user.likes.create!(health_record: @health_record)

    redirect_to public_health_records_path,
                notice: "応援しました🌸"
  end
end
