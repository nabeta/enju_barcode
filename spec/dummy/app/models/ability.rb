class Ability
  include CanCan::Ability

  def initialize(user)
    case user.try(:role).try(:name)
    when 'Administrator'
      can :manage, [
        Barcode
      ]
    when 'Librarian'
      can :manage, [
        Barcode
      ]
    else
      can :show, Barcode
    end
  end
end
