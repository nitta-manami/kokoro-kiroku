class PublicHealthRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @health_records = HealthRecord.includes(:user)
                              .order(created_at: :desc)
  end
end
