define ->
  storage = ->
    supporting = false
    try
      supporting = "localStorage" of window and window["localStorage"] isnt null
      console.log 'supporting'
      console.log supporting
    unless supporting
      function_undefined = ->
        false

      @set = function_undefined
      @get = function_undefined
    else
      @get = (key) ->
        window.localStorage.getItem key

      @set = (key, value) ->
        window.localStorage.setItem key, value

  new storage
