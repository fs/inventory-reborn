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
    ## List units for room
  markdown

  get '/rooms/:room_id/units',
    room_id: Examples.room.id,
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
    { unit: FactoryGirl.attributes_for(:unit).merge({ room_id: Examples.room.id }) }.
      merge({ authentication_token: Examples.user.authentication_token })
end if defined? ApiTaster
