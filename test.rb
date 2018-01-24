require "bundler/setup"
require "minitest/autorun"
require 'lookml/test'

class TestLookML < Minitest::Test
  def setup
    @runner = LookMLTest::Runner.runner
  end

  def test_basic
    result = @runner.sdk.run_inline_query("json_detail", {
      model: "lookml_test_test_fun",
      view: "users",
      fields: ["users.id"],
      sorts: ["users.id asc"],
      limit: 1,
    })
    assert_equal(result.data[0]["users.id"].value, 1)
  end
end
