class MedicationRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @medication_records = current_user.medication_records
                                      .order(recorded_at: :desc)
  end

  def new
    @medication_record = MedicationRecord.new
  end

  def create
    @medication_record = current_user.medication_records.new(medication_record_params)

    @medication_record.recorded_at = Time.current

    if @medication_record.save
      redirect_to home_path, notice: "おくすりを記録しました🌸"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @medication_record = current_user.medication_records.find(params[:id])

    @medication_record.destroy

    redirect_to medication_records_path, notice: "おくすりの記録を削除しました🌸"
  end

  private

  def medication_record_params
    params.require(:medication_record).permit(:status)
  end
end
