class PublicHealthRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
   @health_records = HealthRecord.includes(:user)
                              .order(record_date: :desc)
  end
end
