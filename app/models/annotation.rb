class Annotation
  include ActiveModel::Model
  attr_accessor :annotation, :coordinates, :screenshot_url, :created_at, :updated_at
end
