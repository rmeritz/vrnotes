class AnnotationsController < ApplicationController
  def index
    @annotations = Annotation.scan
  end
end
