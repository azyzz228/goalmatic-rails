require "test_helper"

class ChallengeTest < ActiveSupport::TestCase
  setup do
    @category = categories(:sleep)
  end

  test "challenge cannot have blank name" do
    challenge = Challenge.new(category_id: @category, goal: 40, progress: 1, units: "hours", ends_at: "2023-12-31")
    assert_not challenge.valid?, "Challenge is valid without a name"
    assert_includes challenge.errors[:name], "can't be blank"
  end

  test "challenge cannot have a name == ''" do
    challenge = Challenge.new(name: "", category_id: @category, goal: 40, progress: 1, units: "hours", ends_at: "2023-12-31")
    assert_not challenge.valid?, "Challenge is valid without a name"
    assert_includes challenge.errors[:name], "can't be blank"
  end

  test "increment new challenge's progress when new activity added" do
    challenge = challenges(:challenge_without_activities)
    progress_before_new_activity_added = challenge.progress
    activity = Activity.create(note: "Sleep well", amount: 12, challenge: challenge)
    assert challenge.reload.progress - progress_before_new_activity_added == 12, "did not increment progress properly"
  end

  test "update in acitivty updates progress properly" do
    challenge = challenges(:challenge_without_activities)
    activity = Activity.create(note: "Sleep well", amount: 12, challenge: challenge)
    activity.update(amount: 7)
    assert challenge.reload.progress == 7, "does not upgrade progress when activity amount is updated"
  end

  test "progress decrements when challenge is destroyed" do 
    challenge = challenges(:challenge_without_activities)
    activity = Activity.create(note: "Sleep well", amount: 12, challenge: challenge)
    activity.destroy
    assert challenge.reload.progress == 0, "does not decrement progress when activity is deleted"
  end

end
