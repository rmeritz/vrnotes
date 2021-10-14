class User
  include ActiveModel::Model

  attr_accessor :username, :annotations
  validates :username, :annotations, presence: true

  def initialize(params = {})
    super(params)
    set_annotations
  end

  def set_annotations
    @annotations = ["help"]
  end

  def to_param
    username
  end
end
