class AnnotatedObjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @annotated_objects = @user.annotated_objects
  end
end
