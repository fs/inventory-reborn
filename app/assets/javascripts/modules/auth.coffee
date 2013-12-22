define [
  'init',
  'backbone.marionette',
  'views/layouts/unauthenticated',
  'views/layouts/main'
], (App,
  Marionette,
  Unauthenticated,
  Main) ->

  App.module "Auth", (Mod) ->
    class AuthController extends Marionette.Controller
      login: ->
        loginView = new Unauthenticated
        App.main.show loginView

      main: ->
        MainView = new Main
        App.main.show MainView

    class AuthRouter extends Marionette.AppRouter
      appRoutes:
        '': 'main'
        'login': 'login'

      controller: new AuthController

    Mod.addInitializer ->
      new AuthRouter

    @startWithParent = false

  App.Auth
