class OrganizationUserPolicy < ApplicationPolicy
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

    record.organization.users.include?(user) && OrganizationUser.find_by(organization: record.organization, user: user).admin?
  end

  def destroy?
    record.organization.users.include?(user) && OrganizationUser.find_by(organization: record.organization, user: user).admin?
  end


end
