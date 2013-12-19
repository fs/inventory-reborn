@IA.module "Layouts.Main", (Mod, App, Backbone, Marionette, $, _) ->
  Mod.addInitializer ->
    App.layouts.main = new App.Views.Layouts.Main

  class App.Views.Layouts.Main extends Marionette.Layout
    template: "layouts/main"
    regions:
      content: "#content"

