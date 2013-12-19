@IA.module "Layouts.Unauthenticated.Login", (Mod, App, Backbone, Marionette, $, _) ->
  App.Views.Unauthenticated = App.Views.Unauthenticated or {}

  class App.Views.Unauthenticated.Login extends Marionette.ItemView
    template: "unauthenticated/login"
    events:
      "submit form": "login"

    initialize: ->
      @model = new App.Models.UserSession
      @modelBinder = new Backbone.ModelBinder

    onRender: ->
      @modelBinder.bind @model, @el

    login: (e) ->
      self = this
      el = $(@el)
      e.preventDefault()
      el.find("button.btn-primary").button "loading"
      el.find(".alert-error").remove()
      @model.save @model.attributes,
        success: (userSession, response) ->
          el.find("button.btn-primary").button "reset"
          App.currentUser = new App.Models.User(response)
          App.vent.trigger "authentication:logged_in"

        error: (userSession, response) ->
          result = $.parseJSON(response.responseText)
          el.find("form").prepend App.Helpers.Notifications.error(result.error)
          el.find("button.btn-primary").button "reset"
