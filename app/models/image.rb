class Image < ActiveRecord::Base
  belongs_to :rental
  has_attached_file :pic,
    :path => ":rails_root/public/images/:filename"

  # images work when it is not validated
  do_not_validate_attachment_file_type :pic

# validation caused 'file -b --mime' and images are stored in /tmp
#  validates_attachment_content_type :pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  def generate_filename
     require 'securerandom'
     self.filename = SecureRandom.hex(20)
  end

end
