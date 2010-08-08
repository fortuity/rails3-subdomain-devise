class Subdomain < ActiveRecord::Base
  belongs_to :user
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of :name
end
