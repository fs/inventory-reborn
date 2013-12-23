IA.Helpers.Notifications = {}
IA.Helpers.Notifications.alert = (alertType, message) ->
  HandlebarsTemplates["templates/shared/notifications"]
  alertType: alertType
  message: message


IA.Helpers.Notifications.error = (message) ->
  @alert "error", message

IA.Helpers.Notifications.success = (message) ->
  @alert "success", message

Handlebars.registerHelper "notify_error", (msg) ->
  msg = Handlebars.Utils.escapeExpression(msg)
  new Handlebars.SafeString(IA.Helpers.Notifications.error(msg))

Handlebars.registerHelper "notify_success", (msg) ->
  msg = Handlebars.Utils.escapeExpression(msg)
  new Handlebars.SafeString(IA.Helpers.Notifications.success(msg))
