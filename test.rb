require "bundler/setup"
require "minitest/autorun"
require 'lookml/test'

class TestLookML < Minitest::Test
  def setup
    sdk = LookerSDK::Client.new(
      client_id: ENV['LOOKER_TEST_RUNNER_CLIENT_ID'],
      client_secret: ENV['LOOKER_TEST_RUNNER_CLIENT_SECRET'],
      api_endpoint: ENV['LOOKER_TEST_RUNNER_ENDPOINT'],
    )
    @runner = LookMLTest::Runner.new(
      sdk: sdk,
      branch: ENV['TRAVIS_BRANCH'],
      email: `git log -1 --pretty=format:'%ae'`.strip,
      remote_url: `git config --get remote.origin.url`.strip,
    )
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
