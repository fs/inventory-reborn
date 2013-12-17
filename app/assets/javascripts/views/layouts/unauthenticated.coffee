IA.Views.Layouts.Unauthenticated = Backbone.Marionette.Layout.extend(
  template: 'layouts/unauthenticated'
  regions:
    tabContent: '#tab-content'

  views: {}

  events:
    'click ul.nav-tabs li a': 'switchViews'

  onShow: ->
    @views.login = IA.Views.Unauthenticated.Login
    @tabContent.show new @views.login

  switchViews: (e) ->
    e.preventDefault()
    @tabContent.show new @views[$(e.target).data("content")]
)
IA.addInitializer ->
  IA.layouts.unauthenticated = new IA.Views.Layouts.Unauthenticated()
