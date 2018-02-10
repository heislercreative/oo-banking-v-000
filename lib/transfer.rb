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
    self.balance > amount
  end

  def execute_transaction
    if valid? && sender.sufficient_funds? && self.status == "pending"
      sender.withdraw(amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      invalid_transfer
    end
  end
  
  def reverse_transfer
    
  end

  def invalid_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  
end
