require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  setup do
    @challenge = challenges(:sleep_40)
  end

  test "Requires amount to be greater than 0" do
    activity = Activity.new(note: "Go to bed at 10pm", amount: 0, challenge: @challenge)
    assert_not activity.valid?, "Created Activity with amount not greater than 0"
    assert_includes activity.errors[:amount], "must be greater than 0"
  end
end
