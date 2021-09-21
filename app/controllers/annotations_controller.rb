class AnnotationsController < ApplicationController
  before_action :set_annotation, only: [:edit, :destroy, :update]

  def index
    @annotations = Annotation.scan
  end

  def edit
  end

  def destroy
    @annotation.delete!
    redirect_to annotations_path, alert: "Deleted annotation #{@annotation.coordinate}."
  end

  def update
    @annotation.assign_attributes(annotation_params)
    @annotation.save
    redirect_to annotations_path, alert: "Updated annotation #{@annotation.coordinate}."
  end

  private

  def set_annotation
    @annotation = Annotation.query(
      key_condition_expression: "coordinate = :coordinate",
      expression_attribute_values: {':coordinate': params[:coordinate]},
      limit: 1
    ).first
    raise Aws::Record::Errors::NotFound unless @annotation.present?
  end

  def annotation_params
    params.require(:annotation).permit(:Annotation)
  end
end
