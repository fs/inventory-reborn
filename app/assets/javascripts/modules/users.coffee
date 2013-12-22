define [
  'init',
  'backbone.marionette',
  'collections/users',
  'views/layouts/main'
  'views/users/users'
], (App,
  Marionette,
  Users,
  Main,
  UsersView) ->

  App.module "UsersCollection", (Mod) ->
    class UsersController extends Marionette.Controller
      main: ->
        usersCollection = new Users
        usersCollection.fetch
          error: ->
            console.log "error"

          success: (collection) ->
            usersView = new UsersView
            usersView.collection = usersCollection
            App.main.currentView.content.show usersView


    class MainRouter extends Marionette.AppRouter
      appRoutes:
        'users': 'main'

      controller: new UsersController

    Mod.addInitializer ->
      new MainRouter

    @startWithParent = false

  App.UsersCollection
