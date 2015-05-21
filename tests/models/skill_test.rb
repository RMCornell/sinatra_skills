require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_it_assigns_attributes_correctly
    data =  { "name" => "Skill One",
              "description" => "Description One",
              "id" => 1}

    skill = Skill.new(data)
    assert_equal "Skill One", skill.name
    assert_equal "Description One", skill.description
    assert_equal 1, skill.id
  end

end
