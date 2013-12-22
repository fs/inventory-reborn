define ['init', 'backbone.marionette', 'models/user'], (App, Marionette, User) ->
  class UserView extends Marionette.ItemView
    template: "users/show"
    tagName: "tr"

  class UsersView extends Marionette.CompositeView
    itemView: UserView
    template: "users/index"
    itemViewContainer: "tbody"
    events:
      "click .add-user": "addUser"

    addUser: (event) ->
      editView = new UserEditView
        model: new User
        collection: @collection
      App.dialog.show editView

  class UserEditView extends Backbone.Marionette.ItemView
    model: User
    template: 'users/edit'
    events:
      "click .close": "itemClosed"
      "click .create": "itemCreated"
      "click .model-footer .btn": "itemClosed"

    itemClosed: (event) ->
      event.preventDefault()
      @close()
    itemCreated: (event) ->
      event.preventDefault()
      console.log 'user created'
      console.log this.$el.find('form')
      new_user = new User

      console.log 'JSON.stringify('
      console.log this.getFormData( this.$el.find('form') )
      new_user.set(this.getFormData(this.$el.find('form')))
      console.log 'new_user'
      console.log new_user
      new_user.save()

      @close()

    fetchParams: (form) ->
      rawdata = $(form).serialize()
      rawdata

    getFormData: (form) ->
      unindexed_array = form.serializeArray()
      indexed_array = {}

      $.map(unindexed_array, (n, i) ->
        indexed_array[n['name']] = n['value']
      )

      indexed_array

  UsersView
