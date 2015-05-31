class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    can :read, :all

    can :create, Video if user.persisted?
    can [:update, :destroy, :publish], Video do |video|
      video.user == user or user.moderator? or user.admin?
    end

  end
end
