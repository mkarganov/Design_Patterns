# cake = MakeCakeTask.new
# cake.get_time_required

class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

class CompositeTask < Task
  def initialize(name)
    super(name)
    @subtasks = []
  end

  def add_sub_task(task)
    @subtasks << task
  end

  def remove_sub_task(task)
    @subtasks.delete(task)
  end

  def get_time_required
    time = 0.0
    @subtasks.each { |task| time += task.get_time_required }
    time
  end
end

class AddDryIngredientsTask < CompositeTask
  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0                # 1 minute to add flour and sugar
  end
end

class MixTask < CompositeTask
  def initialize
    super('Mix that batter up!')
  end

  def get_time_required
    3.0                # Mix for 3 minutes
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
    add_sub_task( AddDryIngredientsTask.new )
    # add_sub_task( AddLiquidsTask.new )
    add_sub_task( MixTask.new )
  end
end

class MakeCakeTask < CompositeTask
  def initialize
    super('make cake')
    add_sub_task ( MakeBatterTask.new )
    # add_sub_task ( FillPanTask.new )
    # add_sub_task ( BakeTask.new )
    # add_sub_task ( FrostTask.new )
    # add_sub_task ( LickSpoonTask.new )
  end
end
