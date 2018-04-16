class OrganizationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.users.include?(user) && record.users.find(user.id).admin?
  end

  def destroy?
    record.users.include?(user) && record.users.find(user.id).admin?
  end

end
