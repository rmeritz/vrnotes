class Annotation
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :annotation, :coordinates, :screenshot_url, :created_at, :updated_at, :offset

  def to_param
    offset
  end

  def persisted?
    offset.present?
  end

  def attributes
    {
      'annotation' => nil,
      'coordinates' => nil,
      'screenshot_url' => nil,
      'created_at' => nil,
      'updated_at' => nil
    }
  end
end
