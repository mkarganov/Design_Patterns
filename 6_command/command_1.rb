# save_button = SlickButton.new( SaveCommand.new )

class SlickButton
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  # Lots of button drawing management
  # code omitted...

  def on_button_push
    @command.execute if @command
  end
end

class SaveCommand
  def execute
    #
    # Save the current document...
    #
  end
end

####################
### using blocks ###
####################

class SlickButton
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  def on_button_push
    @command.call if @command
  end
end

new_button = SlickButton.new do
  # Create new document
end
