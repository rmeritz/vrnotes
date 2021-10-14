class Annotation
  include ActiveModel::Model
  include Aws::Record
  set_table_name "annotations"
  string_attr :username, hash_key: true
  string_attr :guid, range_key: true
  list_attr :annotations
end
