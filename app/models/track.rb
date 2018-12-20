# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  band_id    :integer          not null
#  album_id   :integer          not null
#  bonus      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
    validates_presence_of :title, :ord, :band_id, :album_id
    validates :bonus, inclusion: { in: [true, false] }
    validates :ord, uniqueness: { scope: :album_id }

    belongs_to :album,
        class_name: :Album,
        foreign_key: :album_id,
        primary_key: :id

    belongs_to :band,
        class_name: :Band,
        foreign_key: :band_id,
        primary_key: :id
end
