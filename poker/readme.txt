
Combination numbers:  
"0" => High Card: Highest value card.    
"1" => One Pair: Two cards of the same value.  
"2" => Two Pairs: Two different pairs.  
"3" => Three of a Kind: Three cards of the same value.  
"4" => Straight: All cards are consecutive values.  
"5" => Flush: All cards of the same suit.  
"6" => Full House: Three of a kind and a pair.  
"7" => Four of a Kind: Four cards of the same value.  
"9" => Straight (Royal) Flush: All cards are consecutive values of same suit.  

Method "combo" returns a characteristic string for each 5 cards:  
 1) first char - a combination number  
 2) next pare chars - a main card value from combination  
 3) next (if it's necessary) - all cards in descending order  

Characteristic string of 1st player hand is alphabeticaly MORE then 2nd <=> 1st player is a winner
