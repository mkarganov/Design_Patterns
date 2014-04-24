# proxy = AccountProxy.new( BankAccount.new(100), 'maks')
# proxy.deposit(25)
# proxy.withdraw(50)
# proxy.balance

require 'etc'
require './proxy_general.rb'

class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject = real_account
    @owner_name = owner_name
  end

  def method_missing(name, *args)
    check_access
    puts "Delegating #{name} message to subject."
    @subject.send(name, *args)
  end

  def check_access
    if Etc.getlogin != @owner_name
      raise "Illegal access #{@owner_name} cannot access account."
    end
  end
end
