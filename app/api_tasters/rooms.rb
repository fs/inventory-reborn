ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## List all rooms
  markdown

  get '/rooms',
    authentication_token: Examples.user.authentication_token
end if defined? ApiTaster