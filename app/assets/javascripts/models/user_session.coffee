define ['backbone'], (Backbone) ->
  class UserSession extends Backbone.Model
    url: "/users/sign_in"
    paramRoot: "user"
    defaults:
      email: ""
      password: ""

  UserSession
