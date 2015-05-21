require 'yaml/store'

class SkillInventory
  def self.database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= YAML::Store.new("db/skill_inventory_test")
    else
      @database ||= YAML::Store.new("db/skill_inventory")
    end
  end

  def self.create(skill)
    database.transaction do
      database['skills'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['skills'] << {"id" => database['total'], "name" => skill['name'], "description" => skill['description']}
    end
  end

  def self.raw_skills
    database.transaction do
      database['skills'] || []
    end
  end

  def self.all
    raw_skills.map {|data| Skill.new(data)}
  end

  def self.raw_skill(id)
    raw_skills.find {|data| data["id"] == id}
  end

  def self.find(id)
    Skill.new(raw_skill(id))
  end

  def self.update(id, skill)
    database.transaction do
      target = database['skills'].find {|data| data['id'] == id}
      target["name"] = skill[:name]
      target["description"] = skill[:description]
    end
  end

  def self.delete(id)
    database.transaction do
      database['skills'].delete_if {|skill| skill["id"] == id}
    end
  end

  def self.delete_all
    database.transaction do
      database['skill'] = []
      databsee['total'] = 0
    end
  end
end
