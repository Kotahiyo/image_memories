# == Schema Information
#
# Table name: memories
#
#  id         :bigint           not null, primary key
#  image      :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_memories_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
class Memory < ApplicationRecord
  belongs_to :post, optional: true
  mount_uploader :image, ImagesUploader
end
