class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    can :read, :all

    can :create, Video if user.persisted?
    can :create, Post if user.persisted?
    can [:update, :destroy, :publish], Video do |video|
      video.user == user or user.moderator? or user.admin?
    end
    can [:update, :destroy, :publish], Post do |post|
      post.user == user or user.moderator? or user.admin?
    end

    can :manage, Page if user.admin?

  end
end
