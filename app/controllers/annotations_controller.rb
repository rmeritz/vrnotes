class AnnotationsController < ApplicationController
  before_action :authenticate_user!, :set_annotated_object!, :set_annotation!

  def edit
  end

  def destroy
    annotations = @annotated_object.annotations
    annotations.delete_at(params[:offset].to_i)
    if annotations.present?
      @annotated_object.annotations = annotations
      @annotated_object.save
    else
      @annotated_object.delete!
    end
    redirect_to user_annotated_objects_path, alert: "Deleted annotation."
  end

  def update
    @annotation.assign_attributes(annotation_params)
    annotations = @annotated_object.annotations
    annotations[params[:offset].to_i] = @annotation
    @annotated_object.annotations = annotations
    @annotated_object.save
    redirect_to user_annotated_objects_path, alert: "Updated annotation."
  end

  private

  def set_annotated_object!
    @annotated_object = @user.annotated_objects.find do |annotated_object|
      annotated_object.guid == params[:annotated_object_guid]
    end
    raise Aws::Record::Errors::NotFound unless @annotated_object.present?
  end

  def set_annotation!
    @annotation = @annotated_object.annotations[params[:offset].to_i]
    raise Aws::Record::Errors::NotFound unless @annotation.present?
  end

  def annotation_params
    params.require(:annotation).permit(:annotation)
      .merge(updated_at: Time.current)
  end
end
