class ImpressionableController < ApplicationController

  helper_method :impressionable

  before_action :authenticate!

  def like
    Like.create user: current_user, video: impressionable
    respond_with_rating
  end

  def dislike
    Dislike.create user: current_user, video: impressionable
    respond_with_rating
  end

  protected

    def respond_with_rating
      impressionable.reload # counter cache doesn't trigger model update callbacks, so we must force reload

      respond_to do |format|
        format.html { redirect_to impressionable }
        format.js   { render 'create' }
      end
    end

    def impressionable
      @impressionable ||= impressionable_class.classify.constantize.find(impressionable_id)
    end

    def impressionable_class
      parent_klasses = %w[clip screencast]
      parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
    end

    def impressionable_id
      params.fetch "#{ impressionable_class }_id"
    end
end
