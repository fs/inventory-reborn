@IA.module "Layouts.Unauthenticated", (Mod, App, Backbone, Marionette, $, _) ->
  Mod.addInitializer ->
    App.layouts.unauthenticated = new App.Views.Layouts.Unauthenticated

  class App.Views.Layouts.Unauthenticated extends Backbone.Marionette.Layout
    template: 'layouts/unauthenticated'
    regions:
      singInContent: '#sing-in-content'

    onShow: ->
      @singInContent.show new App.Views.Unauthenticated.Login

