class Book < ApplicationRecord
  belongs_to :category, optional: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id title author description price stock created_at updated_at category_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end
end
