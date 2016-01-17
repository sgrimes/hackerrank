#!/usr/bin/env ruby

class Ledger
  attr_accessor :balances
  
  def initialize(people)  @balances = Hash.new{ 0.0 }  end
  
  def add_payment(payer,amount,beneficiaries)
    @balances[payer] += amount
    beneficiaries.each {|b| @balances[b] -= amount.to_f / beneficiaries.count}
  end

  def zero?  # are we done sending payments?
    @balances.select{|k,v| v == 0} == @balances ? true : false
  end

  def highest_person_owing
    min_balance = @balances.values.min
    min_person = @balances.select{|p,b| b == min_balance}.keys.first
  end

  def highest_person_owed
    max_balance = @balances.values.max
    max_person = @balances.select{|p,b,| b == max_balance}.keys.first
  end

  def two_equal?
    @balances.each do |p1,b1|
      @balances.each do |p2,b2|
        if b2 = -b1
          b1 = 0; b2 = 0
        end
      end
    end
  end
  
  def settle
    while not zero?
      two_equal? #check if any two people owe and are owed same amount

      #otherwise have highest person owing pay highest person(s) owed
      payer = highest_person_owing
      recipient = highest_person_owed
      if @balances[recipient] > -1 * @balances[payer]
        puts "#{payer} sends $#{-1*@balances[payer]} to #{recipient}"
        @balances[recipient] -= -1 * @balances[payer]
        @balances[payer] = 0
      else
        puts "#{payer} send $#{@balances[recipient]} to #{recipient}"
        @balances[payer] += @balances[recipient]
        @balances[recipient] = 0
      end
    end
  end
end

l = Ledger.new(["A","B","C","D"])
l.add_payment("A",30,["A","B","D"])
l.add_payment("A",100,["A","D"])
l.add_payment("C",30,["A","B","C","D"])
l.settle
              
