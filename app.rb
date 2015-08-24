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

get('/divisions/:id') do
  division_id = params.fetch('id').to_i()
  @division = Division.find(division_id)
  @employees = []
  Employee.all().each() do |person|
    if person.division_id() == division_id
      @employees.push(person)
    end
  end
  erb(:division_info)
end

post('/divisions/:id') do
  division_id = params.fetch('id').to_i()
  name = params.fetch('name')
  new_employee = Employee.create({:name => name, :division_id => division_id})
  @division = Division.find(division_id)
  @employees = []
  Employee.all().each() do |person|
    if person.division_id() == division_id
      @employees.push(person)
    end
  end
  erb(:division_info)
end
