define [
  'backbone',
  'backbone.marionette',
  'handlebars',
  'views/layouts/main',
  'models/local_storage'
], (Backbone,
  Marionette,
  Handlebars,
  LayoutMain,
  Storage) ->

  Marionette.Handlebars =
    path: "assets/templates/"
    extension: ".hbs"

  Marionette.TemplateCache::load = ->
    return @compiledTemplate  if @compiledTemplate
    if Handlebars.templates and Handlebars.templates[@templateId]
      @compiledTemplate = Handlebars.templates[@templateId]
    else
      template = @loadTemplate(@templateId)
      @compiledTemplate = @compileTemplate(template)
    @compiledTemplate

  Marionette.TemplateCache::loadTemplate = (templateId) ->
    template = undefined
    templateUrl = undefined
    try
      template = Marionette.$(templateId).html()
    if not template or template.length is 0
      templateUrl = Marionette.Handlebars.path + templateId + Marionette.Handlebars.extension
      template = Marionette.$.ajax(
        url: templateUrl
        success: (data) ->
          template = data

        async: false
      ).responseText

      throw "NoTemplateError - Could not find template: '" + templateUrl + "'"  if not template or template.length is 0
    template

  Marionette.TemplateCache::compileTemplate = (rawTemplate) ->
    Handlebars.compile rawTemplate

  oldSync = Backbone.sync
  CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content')
  Backbone.sync = (method, model, options) ->
    options.beforeSend = (xhr) ->
      xhr.setRequestHeader "X-CSRFToken", CSRF_TOKEN
    oldSync method, model, options


  App = new Marionette.Application()
  App.addRegions
    main: "#main"
    dialog: "#dialog"
  App.currentUser = null

  App.addInitializer ->
    App.main.show new LayoutMain
    App.Auth.start()
    App.UsersCollection.start()

  App.on "initialize:after", (options) ->
      Backbone.history.start()

  App
