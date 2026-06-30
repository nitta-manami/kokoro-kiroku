class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
   @recent_health_records = current_user.health_records
                                     .order(created_at: :desc)
                                     .limit(3)
  end
end
