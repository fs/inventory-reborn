define ['backbone.marionette'], (Marionette) ->
  class Main extends Marionette.Layout
    template: "layouts/main_layout"
    regions:
      content: "#content"
  Main

