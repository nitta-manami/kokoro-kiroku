require "test_helper"

class MedicationRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get medication_records_new_url
    assert_response :success
  end

  test "should get create" do
    get medication_records_create_url
    assert_response :success
  end
end
