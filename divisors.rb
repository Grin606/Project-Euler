require 'mathn'

def divisors(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{|p| (0..p).to_a}
  divisors = exponents.shift.product(*exponents).map do 
      |powers|
      primes.zip(powers).map{|prime, power| prime ** power}.reduce(:*)
  end
  divisors.sort
end
