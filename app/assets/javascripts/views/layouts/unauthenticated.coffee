IA.Views.Layouts.Unauthenticated = Backbone.Marionette.Layout.extend(
  template: 'layouts/unauthenticated'
  regions:
    singInContent: '#sing-in-content'

  views: {}

  onShow: ->
    @views.login = IA.Views.Unauthenticated.Login
    @singInContent.show new @views.login
)
IA.addInitializer ->
  IA.layouts.unauthenticated = new IA.Views.Layouts.Unauthenticated()
