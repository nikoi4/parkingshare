class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def show?
    record.user == user || record.parking.user == user
  end

  def create?
    true
  end

  def update?
    record.parking.user == user
  end

  def approve_transaction?
    update?
  end

  def decline_transaction?
    update?
  end
end
