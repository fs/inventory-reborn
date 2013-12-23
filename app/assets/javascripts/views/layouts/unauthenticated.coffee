define [
  'backbone.marionette',
  'views/unauthenticated/login'
], (Marionette, LoginView) ->

  class Unauthenticated extends Marionette.Layout
    template: 'layouts/unauthenticated'
    regions:
      singInContent: '#sing-in-content'

    onShow: ->
      @singInContent.show new LoginView

  Unauthenticated
