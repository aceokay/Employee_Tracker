require("pg")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/division")
require("./lib/employee")

get('/') do
  @divisions = Division.all()
  erb(:index)
end

post('/') do
  @divisions = Division.all()
  name = params.fetch('name')
  division = Division.create({:name => name})
  erb(:index)
end
