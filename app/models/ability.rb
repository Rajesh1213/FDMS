 
 # Roles
 # t.boolean  "superadmin"
 # t.boolean  "admin"
 # t.boolean  "operator"

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.rolesuperadmin? :superadmin
      can :manage, :all
    end

    if user.roleadmin? :admin
      can :read,:all
      can :create, :all 
      can :manage, Customer
      can :manage, MonthlyFinance
      can :manage, MonthlyFinanceRecord
      can :manage, Rent
    end 

    if user.roleoperator? :operator
      can :read, :all
      can :create, :all
    end

    # if user.role? :superadmin
    #   can :manage, :all
    # else
    #   can :read, :all
    #   can :create, Comment
    #   can :update, Comment do |comment|
    #     comment.try(:user) == user || user.role?(:admin)
    #   end
    #   if user.role?(:operator)
    #     can :create, Article
    #     can :update, Article do |article|
    #       article.try(:user) == user
    #     end
    #   end
    # end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
