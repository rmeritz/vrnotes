class AnnotatedObject
  include ActiveModel::Model
  include Aws::Record
  set_table_name "annotations"
  string_attr :username, hash_key: true
  string_attr :guid, range_key: true
  attr :annotations, AnnotationMarshaller.new

  def url
    @queried_url ||= find_url
  end

  private

  def find_url
    ThreeDObject.query(
      key_condition_expression: "guid = :guid",
      expression_attribute_values: {':guid': guid},
      limit: 1
    ).first.try(:url)
  end
end
