define ['backbone'], (Backbone) ->
  class UserSession extends Backbone.Model
    url: "/users/sign_in.json"
    paramRoot: "user"
    defaults:
      email: ""
      password: ""

  UserSession
