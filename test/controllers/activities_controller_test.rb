require "test_helper"

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity = activities(:slept_8)
    @challenge = @activity.challenge
  end

  test "should get index" do
    get challenge_activity_url(@challenge, @activity)
    assert_response :success
  end

  test "should get new" do
    get new_challenge_activity_url(@challenge)
    assert_response :success
  end

  test "should create activity" do
    assert_difference("Activity.count") do
      post challenge_activities_url(@challenge), params: { activity: { challenge_id: @activity.challenge_id, amount: @activity.amount, note: @activity.note } }
    end

    assert_redirected_to challenge_activity_url(@challenge, Activity.last)
  end

  test "should show activity" do
    get challenge_activity_url(@challenge, @activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_activity_url(@challenge, @activity)
    assert_response :success
  end

  test "should update activity" do
    patch challenge_activity_url(@challenge, @activity), params: { activity: { challenge_id: @activity.challenge_id, amount: @activity.amount, note: @activity.note } }
    assert_redirected_to challenge_activity_url(@challenge, @activity)
  end

  test "should destroy activity" do
    assert_difference("Activity.count", -1) do
      delete challenge_activity_url(@challenge, @activity)
    end

    assert_redirected_to challenge_url(@challenge)
  end
end
