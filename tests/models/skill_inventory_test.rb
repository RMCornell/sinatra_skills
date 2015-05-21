require_relative '../test_helper'

class SkillInventoryTest < MiniTest::Test
  def test_it_creates_a_skill
    data = {:name => "Skill One",
            :description => "Description One"}

    SkillInventory.create({ :name        => "Skill One",
                            :description => "Description One" })
    skill = SkillInventory.find(1)

    # assert_equal "Skill One", skill.name
    assert_equal "Description One", skill.description
    assert_equal 1, skill.id
  end
end
