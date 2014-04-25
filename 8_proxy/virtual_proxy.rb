# proxy = VirtualProxy.new { BankAccount.new(50) }
# proxy.deposit(25)
# proxy.balance

require './proxy_general.rb'

class VirtualProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def method_missing(name, *args)
    s = subject
    s.send(name, *args)
  end

  def subject
    @subject ||= @creation_block.call
  end
end
