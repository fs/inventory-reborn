ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## List all users
  markdown

  get '/users',
    authentication_token: Examples.user.authentication_token

end if defined? ApiTaster