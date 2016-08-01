class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= AdmiinUser.new # guest user (not logged in)
       if user.role == "Supervisor"
         can :manage, :all
         can :read, ActiveAdmin::Page, :name => "Dashboard"
       else
        can :read, Movimiento
        can :create, Movimiento
        can :read, Cuenta
        can :create, Cuenta
        can :read, Cliente
        can :create, Cliente
        can :read, ActiveAdmin::Page, :name => "Dashboard"
        cannot :destroy, :all
       end
    
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
