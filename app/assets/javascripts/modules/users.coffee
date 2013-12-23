define [
  'init',
  'backbone.marionette',
  'collections/users',
  'views/layouts/main'
  'views/users/users',
  'models/local_storage'
], (App,
  Marionette,
  Users,
  Main,
  UsersView,
  Storage) ->

  App.module "UsersCollection", (Mod) ->
    class UsersController extends Marionette.Controller
      main: ->
        if Storage.length() > 0
          usersCollection = new Users
          usersCollection.fetch
            error: ->
              console.log "error"

            success: (collection) ->
              usersView = new UsersView
              usersView.collection = usersCollection
              App.main.currentView.content.show usersView
            data: authentication_token: Storage.get("API_KEY")
        else
          (new Backbone.Router).navigate "login",
            trigger: true
            replace: true


    class MainRouter extends Marionette.AppRouter
      appRoutes:
        '': 'main'

      controller: new UsersController

    Mod.addInitializer ->
      new MainRouter

    @startWithParent = false

  App.UsersCollection
