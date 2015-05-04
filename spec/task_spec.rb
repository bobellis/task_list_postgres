require('rspec')
require('task')
require('pry')
require('pg')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(Task) do
  before() do
    Task.clear()
  end

  describe('#description') do
    it('lets you give it a description') do
      test_task = Task.new("reticulate the spines")
      expect(test_task.description()).to(eq("reticulate the spines"))
    end
  end

  describe(".all") do
    it("creates an empty array") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a task to the array of saved tasks') do
      test_task = Task.new('reticulate the spine')
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('.clear') do
    it('clears all saved tasks') do
      Task.new('reticluate the spines').save()
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end

end
