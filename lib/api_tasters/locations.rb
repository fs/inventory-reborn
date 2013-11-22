ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## List all locations
  markdown

  get '/locations',
    authentication_token: Examples.user.authentication_token

  desc <<-markdown.strip_heredoc
    ## List Single location
  markdown

  get '/locations/:id',
    id: Examples.location.id,
    authentication_token: Examples.user.authentication_token

  desc <<-markdown.strip_heredoc
    ## Create location
  markdown

  post '/locations',
    location: FactoryGirl.attributes_for(:location),
    authentication_token: Examples.user.authentication_token

  desc <<-markdown.strip_heredoc
    ## Update location
  markdown

  put '/locations/:id',
    id: Examples.location.id,
    location: FactoryGirl.attributes_for(:location),
    authentication_token: Examples.user.authentication_token
 end if defined? ApiTaster
