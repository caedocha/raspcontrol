class Raspberry < ActiveRecord::Base
  validates :name, presence: true
  validates :command, presence: true
end
