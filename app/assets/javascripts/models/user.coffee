@IA.module "UsersModule", (Mod, App, Backbone, Marionette, $, _) ->
  class App.Models.User extends Backbone.Model

  class App.Models.Users extends Backbone.Collection
    url: "/users.json?authentication_token=xpUpK6AABjnZs8VUAnux"
    model: App.Models.User

  class UserView extends Backbone.Marionette.ItemView
    model: App.Models.User

  class UsersView extends Backbone.Marionette.CompositeView
    itemView: UserView
    itemViewContainer: "ul"
