class MedicationRecordsController < ApplicationController
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

  private

  def medication_record_params
    params.require(:medication_record).permit(:status)
  end
end