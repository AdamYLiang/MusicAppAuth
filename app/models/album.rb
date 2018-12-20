# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :integer
#  band_id    :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
    validates_presence_of :title, :year, :band
    validates :live, inclusion: { in: [true, false] }


    belongs_to :band,
        class_name: :Band,
        foreign_key: :band_id,
        primary_key: :id
end