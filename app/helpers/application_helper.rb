module ApplicationHelper
  def formatted_position(annotation, annotated_object)
    offsets = coordinates_to_position(annotated_object.coordinate_offset)
    position = coordinates_to_position(annotation.coordinates).map.with_index do |p, i|
      p - offsets[i]
    end
    position.join(" ")
  end

  def coordinates_to_position(coordinates)
    if coordinates.present?
      coordinates.tr("(),", "").split(" ").map(&:to_f)
    else
      [0.0, 0.0, 0.0]
    end
  end
end
