@IA.module "UserSessionModule", (Mod, App, Backbone, Marionette, $, _) ->
  class App.Models.UserSession extends Backbone.Model
    url: "/users/sign_in.json"
    paramRoot: "user"
    defaults:
      email: ""
      password: ""
