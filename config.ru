require 'bundler'
Bundler.require

require ::File.expand_path('../config/environment', __FILE__)
#the :: is escaping it so that the File returns to look globally instead of looking at the instance of a particular class


run SkillInventoryApp
