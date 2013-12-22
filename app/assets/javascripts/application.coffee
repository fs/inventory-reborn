requirejs ["init"], (app) ->
  "use strict"
  onDeviceReady = ->
    document.getElementsByTagName("body")[0].className = ""
    require ['jquery', 'modules/auth', 'modules/users', 'modules/units'], ->
      app.start()

   $ ->
     if window.cordova
       document.addEventListener "deviceready", onDeviceReady, false
     else
       onDeviceReady()
