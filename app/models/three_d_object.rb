class ThreeDObject
  include ActiveModel::Model
  include Aws::Record
  set_table_name "three_d_objects"
  string_attr :guid, hash_key: true
  string_attr :url
end
