class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
    # record.user == user || record.parking.user == user
  end

  def create?
    true
  end

  def update?
    record.parking.user == user
  end
end
