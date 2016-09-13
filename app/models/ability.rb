class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)
    if user.has_role?(:admin)         # add role :admin to user (rake db:seed)
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard
      can :manage, :all
    elsif user.has_role?(:subscriber)
      can :read, :all
    elsif user.has_role?(:editor)
      can :read, :all
    else
      can :read, :all
    end
  end
end
