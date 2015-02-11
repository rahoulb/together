class Section < ActiveRecord::Base
  belongs_to :website, touch: true
  has_many :pages, dependent: :destroy
  has_attached_file :header_image
  validates_attachment_content_type :header_image, content_type: /\Aimage/

  def to_param
    "#{id}-#{name}".parameterize
  end
end
