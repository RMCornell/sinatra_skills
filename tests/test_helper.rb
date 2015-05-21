ENV['TASK_MANAGER_ENV'] ||= 'test'
#Sets up the environment for Test Environment
#name can be different
#use test environment database instead of production database

require File.expand_path("../../config/environment", __FILE__)
#so we have access to the environment
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

class Minitest::Test
  def teardown
    SkillInventory.delete_all
  end
end

Capybara.app = SkillInventoryApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
