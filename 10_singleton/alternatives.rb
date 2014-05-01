# lazy instantination

require 'singleton'

class SimpleLogger
  include Singleton

  #lots of code...
end

# class as singleton

# ClassBasedLogger.level = ClassBasedLogger::INFO
# CLassBasedLogger.info('Computer wins chess game.')

class ClassBasedLogger
  ERROR = 1
  WARNING = 2
  INFO = 3

  @@log = File.open('log.txt', 'w')
  @@level = WARNING

  def self.warning(msg)
    @@log.puts(msg) if @@level >= WARNING
    @@log.flush
  end

  def self.info(msg)
    @@log.puts(msg) if @@level >= INFO
    @@log.flush
  end

  # etc...

  def self.level=(new_level)
    @@level = new_level
  end

  def self.level
    @@level
  end
end

# as module

# ModuleBasedLogger.info('Computer wins chess game.')

module ModuleBasedLogger
  ERROR = 1
  WARNING = 2
  INFO = 3

  @@log = File.open('log.txt', 'w')
  @@level = WARNING

  def self.error(msg)
    @@log.puts(msg)
    @@log.flush
  end

  # same code as in ClassBasedSingleton
end


