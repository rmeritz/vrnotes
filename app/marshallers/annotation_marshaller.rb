class AnnotationMarshaller
  def type_cast(raw_value)
    raw_value.to_a.map do |raw_annotation|
      Annotation.new({
        annotation: raw_annotation["annotation"],
        coordinates: raw_annotation["coordinates"],
        screenshot_url: raw_annotation["screenshot_url"],
        created_at: raw_annotation["created_at"].try(:to_datetime),
        updated_at: raw_annotation["updated_at"].try(:to_datetime)
      })
    end
  end

  def serialize(raw_value)
    raw_value
    # TODO
  end
end
