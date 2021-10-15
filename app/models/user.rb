class User
  include ActiveModel::Model

  attr_accessor :username, :annotated_objects
  validates :username, :annotated_objects, presence: true

  def initialize(params = {})
    super(params)
    set_annotated_objects
  end

  def to_param
    username
  end

  private

  def set_annotated_objects
    @annotated_objects = AnnotatedObject.query(
      key_condition_expression: "username = :username",
      expression_attribute_values: {':username': username},
    )
  end
end
