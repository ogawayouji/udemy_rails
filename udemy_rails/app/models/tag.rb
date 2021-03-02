# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
    # 二つ必要
    has_many :board_tag_relations, dependent: :delete_all 
    has_many :boards, through: :board_tag_relations
end
