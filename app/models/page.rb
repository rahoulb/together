class Page < ActiveRecord::Base
  paginates_per 10
  belongs_to :section, touch: true

  scope :latest, -> { order('updated_at desc') }
end
