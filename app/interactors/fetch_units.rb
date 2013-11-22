class FetchUnits
  include Interactor::Organizer

  organize [
    GetUnits,
    GetAncestors
  ]
end
