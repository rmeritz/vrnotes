class Annotation
  include ActiveModel::Model
  include Aws::Record
  set_table_name "TrialTable"
  string_attr :coordinate, hash_key: true
  string_attr :Annotation

  def to_param
    coordinate
  end
end
