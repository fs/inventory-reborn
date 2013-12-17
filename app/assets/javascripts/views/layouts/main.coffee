IA.Views.Layouts.Main = Backbone.Marionette.Layout.extend(
    template: "layouts/main"
    regions:
      content: "#content"
)
IA.addInitializer ->
  IA.layouts.main = new IA.Views.Layouts.Main()

