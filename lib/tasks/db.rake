namespace :db do
  desc 'Generates model schema diagram'
  task generate_schema_diagram: :environment do
    %x(bundle exec erd --filetype=png --notation=uml --inheritance --polymorphism --filename=doc/schema)
  end
end
