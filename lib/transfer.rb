class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end

  def sufficient_funds?
    sender.balance > amount
  end

  def execute_transaction
    if valid? && sufficient_funds? && self.status = "pending"
      sender.withdraw(amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
  end
  
end
