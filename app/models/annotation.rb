class Annotation
  include Aws::Record
  set_table_name "TrialTable"
  string_attr :coordinate
  string_attr :Annotation
end
