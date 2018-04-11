class StepPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.steplist.user == user
  end

  def update?
    record.steplist.user == user
  end

  def destroy?
    record.steplist.user == user
  end

  def show?
    true
  end
end
