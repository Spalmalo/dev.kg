class TagsController < ApplicationController
  autocomplete :tag, :name, class_name: 'ActsAsTaggableOn::Tag'
end