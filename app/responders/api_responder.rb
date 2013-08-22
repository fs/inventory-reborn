class ApiResponder < ActionController::Responder
  def api_behavior(error)
    raise error unless resourceful?

    if get?
      display resource
    elsif post?
      display resource, status: :created, location: nil
    elsif put?
      display resource, status: :ok
    else
      head :no_content
    end
  end
end
