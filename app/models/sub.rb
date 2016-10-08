# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  moderator_id :integer          not null
#  title        :string           not null
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :moderator_id, presence: true

  belongs_to :moderator, foreign_key: :moderator_id, class_name: :User
  has_many :posts
end
