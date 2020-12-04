# == Schema Information
#
# Table name: relationsips
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  follower_id  :bigint           not null
#  following_id :bigint           not null
#
# Indexes
#
#  index_relationsips_on_follower_id   (follower_id)
#  index_relationsips_on_following_id  (following_id)
#
# Foreign Keys
#
#  fk_rails_...  (follower_id => users.id)
#  fk_rails_...  (following_id => users.id)
#
require 'test_helper'

class RelationsipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
