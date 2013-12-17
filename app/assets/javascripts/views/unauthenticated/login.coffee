IA.Views.Unauthenticated = IA.Views.Unauthenticated or {}
IA.Views.Unauthenticated.Login = Backbone.Marionette.ItemView.extend(
  template: "unauthenticated/login"
  events:
    "submit form": "login"

  initialize: ->
    @model = new IA.Models.UserSession()
    @modelBinder = new Backbone.ModelBinder()

  onRender: ->
    @modelBinder.bind @model, @el

  login: (e) ->
    self = this
    el = $(@el)
    e.preventDefault()
    el.find("input.btn-primary").button "loading"
    el.find(".alert-error").remove()
    @model.save @model.attributes,
      success: (userSession, response) ->
        el.find("input.btn-primary").button "reset"
        IA.currentUser = new IA.Models.User(response)
        IA.vent.trigger "authentication:logged_in"

      error: (userSession, response) ->
        result = $.parseJSON(response.responseText)
        el.find("form").prepend IA.Helpers.Notifications.error(result.error)
        el.find("input.btn-primary").button "reset"

)
