class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    can :read, :all

    can :create, Video if user.persisted?
    can [:update, :destroy], Video do |video|
      video.user == user
    end

  end
end
