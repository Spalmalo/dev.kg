class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    can :read, :all

    can :create, Screencast if user.persisted?
    can [:update, :destroy], Screencast do |screencast|
      screencast.user == user
    end

  end
end
