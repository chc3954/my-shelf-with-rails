class Document < ApplicationRecord
  has_one_attached :file

  # Callback to set metadata before saving the record
  before_save :set_metadata

  private

  def set_metadata
    if file.attached? && name.blank?
      self.name = file.filename.to_s
      self.file_size = file.byte_size
      self.file_type = file.content_type
    end
  end
end
