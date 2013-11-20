ApiTaster.routes do
  desc <<-markdown.strip_heredoc
    ## List all units
  markdown

  get '/units',
    authentication_token: Examples.user.authentication_token


  desc <<-markdown.strip_heredoc
    ## List units for user
  markdown

  get '/users/:user_id/units',
    user_id: Examples.user.id,
    authentication_token: Examples.user.authentication_token


  desc <<-markdown.strip_heredoc
    ## List units for location
  markdown

  get '/locations/:location_id/units',
    location_id: Examples.location.id,
    authentication_token: Examples.user.authentication_token

  desc <<-markdown.strip_heredoc
    ## Single unit
  markdown

  get '/units/:id',
    id: Examples.unit.id,
    authentication_token: Examples.user.authentication_token

  desc <<-markdown.strip_heredoc
    ## Create unit
  markdown

  post '/units',
    {
      unit: FactoryGirl.attributes_for(:unit).
        merge({ location_id: Examples.location.id, user_id: Examples.user.id })
    }.merge({ authentication_token: Examples.user.authentication_token })

  desc <<-markdown.strip_heredoc
    ## Update unit
  markdown

  put '/units/:id',
    {
      id: Examples.unit.id,
      unit: FactoryGirl.attributes_for(:unit).
        merge({ location_id: Examples.location.id, user_id: Examples.user.id })
    }.merge({ authentication_token: Examples.user.authentication_token })
end if defined? ApiTaster
