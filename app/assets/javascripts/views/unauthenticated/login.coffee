define [
  'init',
  'backbone',
  'Backbone.ModelBinder',
  'backbone.marionette',
  'models/user_session',
  'models/user',
  'models/local_storage'
], (App,
  Backbone,
  ModelBinder,
  Marionette,
  UserSession,
  User,
  Storage) ->

  class LoginView extends Marionette.ItemView
    template: "unauthenticated/login"
    events:
      "submit form": "login"

    initialize: ->
      @model = new UserSession
      @modelBinder = new ModelBinder

    onRender: ->
      @modelBinder.bind @model, @el

    login: (e) ->
      self = this
      el = $(@el)
      e.preventDefault()
      el.find("button.btn-primary").val "loading"
      el.find(".alert-error").remove()
      @model.save @model.attributes,
        success: (userSession, response) ->
          el.find("button.btn-primary").val "reset"
          App.currentUser = new User(response)
          Storage.set "API_KEY", App.currentUser.attributes.authentication_token
          (new Backbone.Router).navigate "",
            trigger: true
            replace: true

        error: (userSession, response) ->
          result = $.parseJSON(response.responseText)
          el.find("form").prepend App.Helpers.Notifications.error(result.error)
          el.find("button.btn-primary").button "reset"
