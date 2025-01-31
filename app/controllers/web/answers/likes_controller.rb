# frozen_string_literal: true

class Web::Answers::LikesController < Web::Answers::ApplicationController
  def create
    like = resource_answer.likes.build
    like.resume = resource_answer.resume
    like.user = current_user
    like.save!
    flash[:success] = t('flash.web.answers.likes.create.success')

    redirect_to resume_path(resource_answer.resume)
  end

  def destroy
    like = resource_answer.likes.find_by user: current_user
    like&.destroy!
    flash[:success] = t('flash.web.answers.likes.destroy.success')

    redirect_to resume_path(resource_answer.resume)
  end
end
