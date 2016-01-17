#!/usr/bin/env ruby

class Ledger
  attr_accessor :balances
  
  def initialize(people)
    @people = people
    @balances = Hash.new
    @people.each {|p| @balances[p] = 0.0 }
  end
  
  def add_payment(array)
    person,amount,beneficiaries = array
    @balances[person] += amount
    beneficiaries.each {|b| @balances[b] -= amount.to_f / beneficiaries.count}
  end

  def zero?
    @balances.each {|person, balance| return false if balance != 0 }
    true
  end

  def highest_person_owing
    hp = "";  amount = 0
    @balances.each do |p,b|
      if b < amount
        hp = p
        amount = b 
      end
    end
    #puts "highest owing is #{hp}"
    hp
  end

  def highest_person_owed
    hp = "";    amount = 0
    @balances.each do |p,b|
      if b > amount
        hp = p
        amount = b
      end
    end
    hp
  end

  def two_equal?
    @balances.each do |p1,b1|
      @balances.each do |p2,b2|
        if b2 = -b1
          b1 = 0
          b2 = 0
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
l.add_payment(["A",30,["A","B","D"]])
l.add_payment(["A",100,["A","D"]])
l.add_payment(["C",30,["A","B","C","D"]])
l.settle
              
