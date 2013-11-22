class FetchUnits::GetAncestors
  include Interactor

  def perform
    context[:ancestors] = if user.persisted?
      [:location]
    elsif location.persisted?
      [:user]
    else
      [:user, :location]
    end
  end
end
