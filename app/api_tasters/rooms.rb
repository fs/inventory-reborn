ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## List all rooms
  markdown

  get '/rooms',
    authentication_token: Examples.user.authentication_token


  desc <<-markdown.strip_heredoc
    ## List Single room
  markdown

  get '/room/:id',
    id: Examples.room.id,
    authentication_token: Examples.user.authentication_token
 end if defined? ApiTaster