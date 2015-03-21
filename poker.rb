$card_hash = {
"2"=> "02",
"3"=> "03",
"4"=> "04",
"5"=> "05",
"6"=> "06",
"7"=> "07",
"8"=> "08",
"9"=> "09",
"T"=> "10", 
"J"=> "11",
"Q"=> "12",
"K"=> "13",
"A"=> "14"}

def combo(arr)
  card_value, card_suit = arr.map{|c| c.split("")}.transpose
  card_value = card_value.map{|c| $card_hash[c]}.sort.reverse # convert cards with hash and sort in desc order 
  case card_value.uniq.length # number of different card values
  when 2 # 4 or 3+2
    if card_value[1] == card_value[3] # 4: 44441 / 14444
      return "7" + card_value[2]
    else # 3+2: 33322 / 22333
      return "6" + card_value[2]
    end
  when 3 # 3 or 2+2
    middle = card_value[2]
    if card_value.count(middle) == 3 # 3: 33311 / 13331 / 33311
      return "3" + middle
    else # 2+2: 22221 / 22122 / 12222
      return "2" + card_value[1] + card_value[3] + card_value.join
    end
  when 4 # 2
    second = card_value[1]
    if card_value.count(second) == 2 # 22111 / 122111
      return "1" + second + card_value.join
    else # 11221 / 11122
      return "1" + card_value[3] + card_value.join
    end
  else # all card values are different
    combo_num = 0
    combo_num += 4 if card_value[0].to_i - card_value[4].to_i == 4 # straight
    combo_num += 5 if card_suit.uniq[1].nil? # flush
    return combo_num.to_s + card_value.join
  end
end

card_string = "8C TS KC 9H 4S 7D 2S 5D 3S AC 
5C AD 5D AC 9C 7C 5H 8D TD KS" #... see file poker.txt

sum = 0
card_string.each_line do |line|
  cards_both = line.chomp.split(" ")
  cards_1, cards_2 = cards_both[0..4], cards_both[5..9]
  sum += 1 if combo(cards_1) > combo(cards_2)
end
p sum

