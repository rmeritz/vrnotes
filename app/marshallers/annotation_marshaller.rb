class AnnotationMarshaller
  def type_cast(raw_value)
    raw_value.to_a.map.with_index do |raw_annotation, i|
      if raw_annotation.class.name == Annotation.name
        raw_annotation
      else
        Annotation.new({
          annotation: raw_annotation["annotation"],
          coordinates: raw_annotation["coordinates"],
          screenshot_url: raw_annotation["screenshot_url"],
          created_at: raw_annotation["created_at"].try(:to_datetime),
          updated_at: raw_annotation["updated_at"].try(:to_datetime),
          offset: i
        })
      end
    end
  end

  def serialize(raw_value)
    raw_value.map do |annotation|
      annotation.as_json
    end
  end
end
