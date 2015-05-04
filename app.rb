require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/task')
require('pg')

DB = PG.connect({:dbname => "to_do"})


get('/') do
  @task_list = Task.all()
  erb(:index)
end

post('/task_list') do
  description = params.fetch('description')
  task = Task.new(description)
  task.save()
  erb(:task_saved)
end
