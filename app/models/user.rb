class User
  include ActiveModel::Model

  attr_accessor :username, :annotations
  validates :username, :annotations, presence: true

  def initialize(params = {})
    super(params)
    set_annotations
  end

  def to_param
    username
  end

  private

  def set_annotations
    @annotations = Annotation.query(
      key_condition_expression: "username = :username",
      expression_attribute_values: {':username': username},
    )
  end
end
