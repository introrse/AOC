//
//  Day02.swift
//  
//
//  Created by Jason on 12/6/18.
//

import Foundation

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Day 2 -- Looking for the Santa-suit fabric cartons

let d2_inputString = "bpacnmelhhzpygfsjoxtvkwuor|biacnmelnizqygfsjoctvkwudr|bpaccmllhizyygfsjoxtvkwudr|rpacnmelhizqsufsjoxtvkwudr|bfacnmelhizqygfsjoxtvwwudp|bpacnmelhizqynfsjodtvkyudr|bpafnmelhizqpgfsjjxtvkwudr|bpackmelhizcygfsjoxtvkwudo|bmacnmilhizqygfsjoltvkwudr|bpafnmelhizuygfsjoxtvkwsdr|boacnmylhizqygfsjoxtvxwudr|bpbcjmelhizqygfsjoxtgkwudr|bpacnmglhizqygfsjixtlkwudr|bpacnmclhizqygfsjoxtvkwtqr|bpacnmelhczqygtsjoptvkwudr|bpacnmelhizqywfsaoxtvkbudr|apacnmelhizqygcsjoxtvkwhdr|bpacnmelrizqygfsbpxtvkwudr|tpkcnmelpizqygfsjoxtvkwudr|bpacnmelhizqlgfsjobtmkwudr|npacnmelhizqygffjoxtvkwudf|bpacnmeehqzqygqsjoxtvkwudr|bpecnmelhizqigfsjvxtvkwudr|bpacnmelhizqysfsjoxtvkdfdr|bpacnfelhkzqygfsjoxtvkwfdr|bpacnbelvizqygfsjoxthkwudr|bpacnoelhizqygfejoxtvkwudn|bpacnmelhizqygfzpkxtvkwudr|bpahnmelhizqyufsjoxmvkwudr|bpacnmelhizqygfsnoxtvkwmmr|bpacnmelhizqygfsjoatvkludf|bpacnmylhizqygfsjlxtvksudr|bpacnmekhpzqygysjoxtvkwudr|bpacnselhizqogfswoxtvkwudr|bpacnmelhizqprfsjoxwvkwudr|bpatnmelhinqygfsjoctvkwudr|bpacnqelhqzqygfsxoxtvkwudr|bpabnmelhiyqygfsjoxtykwudr|bpacnivlhizqygfsjoxtviwudr|bpkcnmylhizqygfsjoxtvkwcdr|bpafnmflhizqygtsjoxtvkwudr|bpachmelhizqygfsjixtvkwudg|bpacymelhizqygfsjoxtykwuar|bpacnkelhizqdgfsjoxtskwudr|bpacnmezhizqggbsjoxtvkwudr|bpacnmqlhizqygrsjoxzvkwudr|bpaczmelhizqyhfsjoxfvkwudr|bdacnmelhyzqygusjoxtvkwudr|bpacbmelhizqywfsjostvkwudr|bpacnmelhihzygfstoxtvkwudr|bpactmelhizqygfsjcxtvkwydr|bkacnmethizqytfsjoxtvkwudr|bpacnmalhizqydfskoxtvkwudr|spacnmelbizqygfsjoxdvkwudr|lpalnmelhizoygfsjoxtvkwudr|bpacjmeghizqygfsjoxtviwudr|bpacnmeqhizxygfsjoxgvkwudr|bpacnmelhizqygosjoxtvkkuhr|bpacnmelhiznbxfsjoxtvkwudr|bgacnmelhizqygfsjbxivkwudr|bpacnmelhizqygfjjowtvswudr|bpacnmelhizqygfsjovtgkmudr|bpacnmelcmzqygfspoxtvkwudr|bpvcnmelhizqyvfcjoxtvkwudr|bpacnmeahizqjgfsjoxtvkwukr|bpacnoelwizqygfsjoxtvkaudr|xpacnmelhizqygfsjoxdvkwedr|mpacnmelqizqygfsjoxtvkwudx|bppcnmelhizqygfsjfxtvkhudr|bpacnmclhizqyhfsjaxtvkwudr|opacsmelhizqygfsjmxtvkwudr|bpafnmelhizqjgfsjoxtvkrudr|bpdcnmilhizqygfsjoxtvkludr|bpainmelhizqygfsjtntvkwudr|bradnmelhizqygfsjextvkwudr|bpacnmelhizqygfmsoxtvkwudg|bpacneelhizqygvrjoxtvkwudr|bpacnpelhizqygfsjoxyvkwudf|bpacnmelhizqygfsqoqtvkwodr|bpacnmelhizjyghsjoxcvkwudr|bpacnmelmibqygfsjoxtvnwudr|jpacnmelaizqygfwjoxtvkwudr|zpachmelhizqygfsjsxtvkwudr|bpacnmelfizqykfsjomtvkwudr|bpacnmllwizqygfsjoxtvkwusr|bpaynmelhizqygfsjoxtvowcdr|jpacnmqlhizqygfsjoxtvknudr|bpacxmelhizqyffsjoxtvkwugr|apawnmelhizqygfsjtxtvkwudr|mpacnmelhitqigfsjoxtvkwudr|bpacnmelhhzqygfsjoxtvkyzdr|gpacnmelhizqynfsjoxtvkwudm|bnacnkelhizqygfsjoxtpkwudr|bpacnmelfizqygfsumxtvkwudr|bpacnmelhisqygfsjohtvowudr|bpacnmelhimqygxsjoxtvkwudn|bpscnmeliizqygfsjoxtvkwunr|qpacnmelhizqycfsjoxtvkwndr|bpacnmelhijqygfsjohtvkyudr|bpacnmelhizqykfsjkxtvknudr|bpacnqilhizqygfsjoxtvkoudr|bpacnmelhizqzgmsjoxtvkwurr|bpdcnmelhizqygfsjoutukwudr|bpecnmeghizqygfsjoxgvkwudr|bpicnmelhizqygfrjoxtvlwudr|bpacnmelhizfygfsroxtvkwodr|buacnmelhizqygjsjoxtvkvudr|bpacnmelhixqykfsjoxtvrwudr|bpacnmelhizqygvejcxtvkwudr|bpacnmjlhizqylfsjoxtvkwuor|qpacnmelhizqygfsjoxfdkwudr|bpfcnmemhizqygfsjoxtvknudr|bpacnmelhizqoffsjqxtvkwudr|hpacnielhiqqygfsjoxtvkwudr|gpacnmelhizqygfsewxtvkwudr|bpacnmellizqylxsjoxtvkwudr|bpacnmenhizqymfsjoxtvkmudr|bpacnfelhizqygcsjoltvkwudr|bpacnmelhqqqygfsjoxtvkuudr|bplgnmelhiqqygfsjoxtvkwudr|bpacnzelhizqygfgjoxtvnwudr|bpacnmelhizqygfsjoktvknunr|bpacnmdlhioqygfnjoxtvkwudr|epacnmelwizqyjfsjoxtvkwudr|bpacxmelhazfygfsjoxtvkwudr|bpacnmejhezqygfsjoxtskwudr|bpacnqelhihqyzfsjoxtvkwudr|bpacnbelhizqyrfsjoxtvkmudr|bpacnmelhizqygfsjoxtylwzdr|bpacnmelwizqygfsjodtvkhudr|bpacnnelhizqygfsjoxtwkwadr|bpacimelhizqygfsnoxtvkwuor|bpacnmelhizqyaasjoxtlkwudr|bpacnmelhizqyeffjoxtvkwuds|bpacnmenhizqygxscoxtvkwudr|bpacnmelhidqygfsjowtskwudr|bpacnmeliizqygfsjoxhvkwucr|bpacimelhizqygfsjoxtvktuwr|bpainmelhhzqygfsjzxtvkwudr|bpacamelhizqygfsjogtvkwbdr|bpccnmelgizqygfsjoxtykwudr|bpacnmelhizwegfsjoxtvkwadr|bpackmelhbzqygqsjoxtvkwudr|bpacymeihizqyffsjoxtvkwudr|bpacnielhczqygfsjoxtvkwudk|bpacnmejhizqygffjoxjvkwudr|ppacnmelhizqygfsjoxtigwudr|bpjcnmolhizqygfsjoxtvkwndr|bpacnmelcizqygrsjoxtakwudr|cpawnmelhizqygfsjoxmvkwudr|bwacnmelhizqygesjoxtakwudr|bpacnmelhizqygfsjexsvkwddr|bpaunmelhiuqygfsjoxtvkwtdr|bpacnmellimqygfsjextvkwudr|bpacnmerhizqygfsaoxvvkwudr|bpacnmglhizqygfsjixtukwudr|ppacnmelhizqygfsjoxtvkdudp|bpacnmedhizqygukjoxtvkwudr|bpccnmelhizqngfsjoxtvkwadr|bgacnmeldizqygfscoxtvkwudr|bpacngelhizsygfsjoxtvkwkdr|bpacnpelhizqygfsjoxctkwudr|bpacnmylhizqygfcjoxtvkwmdr|npacnmelhizqygfsjoxtwkwuds|bpaxnmelhizqydfsjoxyvkwudr|bpacnhelhizjygfsjoxtvkmudr|bpacnkelhczqygfnjoxtvkwudr|bfacnmelhizrygfsjoxtvkwodr|bpycnmelhizqygfofoxtvkwudr|qpacpselhizqygfsjoxtvkwudr|bpvcnmelhezqygfsjoxttkwudr|bpacnmwlhizqygfijoxtmkwudr|bsacnmelhikqygfsjoxttkwudr|bpccnxelhizqyafsjoxtvkwudr|bpacnmelhizqygfswhxtvewudr|vpacnmzlhizqygfsvoxtvkwudr|bpacnmelhihqygfsjoxtvkqurr|bpacnmelhixqygazjoxtvkwudr|bpavnmelhizqygfsjozpvkwudr|bpacnmclhizuygfsjoxmvkwudr|bpacnmelhizryufsjoxtkkwudr|bpacnmelhtzqygfsjobtvkwufr|bpacnmelhizqmlfsjoxtvkwudq|bpaaneelhizqygfsjlxtvkwudr|bpacnmelhxzqygfsjoxthkwuhr|bpacnmeshizqygfcjoxtvkwude|bpacnzqlhizqygfsxoxtvkwudr|bgaanmelhizqycfsjoxtvkwudr|bpacnmexhizqygfsroxtvkwudn|bpmmnmelhizqygfajoxtvkwudr|bpacnmelhizqylfsjoxtckwhdr|bpicnmelhizqyrfsjoxtvkwudi|zpacnmelhizvycfsjoxtvkwudr|bpamnmkllizqygfsjoxtvkwudr|bpacnmelhrzqyrfsjoxgvkwudr|bpadnmelhczqygfsjoxtlkwudr|bpacrmelhizqygrsjoxtvkiudr|lpacnmelhizqygfsjoxtgkwxdr|fpacnmalhiuqygfsjoxtvkwudr|bpacnmelhizqygfsjixtvfwcdr|bpccnmelhxzqygfkjoxtvkwudr|bpacnmepaizqygfsjoctvkwudr|tpacnmelhivqygfsxoxtvkwudr|kpacnfelhitqygfsjoxtvkwudr|baacnzelhizqygfsjoxtvkwudx|bcycnmeghizqygfsjoxtvkwudr|wpacotelhizqygfsjoxtvkwudr|bpacnmsshizqygrsjoxtvkwudr|blacnmelhizqygfsjoxtykwvdr|bkacnmelhizqygfsjoxuvkludr|bpacnmelhizaugfsjoxtvhwudr|fpavnmelhizqygfsgoxtvkwudr|bpachmelnizqygfsjextvkwudr|bpacnmelhizqpgfsjoxtvkwldu|bpacnmelhizqygfsloftvywudr|bpacntelhvzqygfejoxtvkwudr|bpacnmeldizqygfsjmxtvkdudr|byacnmelhizqygfsjsxtvkwudh|bpacnmellizqygssxoxtvkwudr|bpacnmelhizqygfsjootvknuir|bpacnmelhitqjgfsjoxivkwudr|bpacnmelhazaygfsjoxtvfwudr|bpacnzenhizqygfsjzxtvkwudr|bpacnmelhizqypfsdoxtvkwuar|bpannmelhizqygnsjoxtvkwndr|bracnmeldizsygfsjoxtvkwudr|bpacnmelhizwygfsjugtvkwudr|bpatnmelhizqygfsjoytvkwulr|upacnmelhizqygfsjurtvkwudr|bpaenmezhizqygfsjostvkwudr|bpacnmelhizpygfsjodhvkwudr|bpacnmelhizqygfsjogtvkguwr|bpacnmelhisqygfsjoxtpkuudr|bxacnmelhizqygfsjdxtvkfudr|bpacnmelhizqygfsjohqvkwudu|bzacnmtlhizqygfsjoxsvkwudr|bpacnmplhixrygfsjoxtvkwudr|bpacnmelhizqhgfsjomtvkwudg|bpacnmezhizqygfsjxxtykwudr|bpacnmwlhizqygfujoxtzkwudr|tpacnmelhizqygfsjoxkvpwudr|bpawsmenhizqygfsjoxtvkwudr|bpacnmelhizqtgfsjoxttkwuqr|bpkcbmelhizqygfsjoxtvkwucr|bpacfmekhizqygfsjoxtvkwuds|bpacnmethizqynfajoxtvkwudr|bpocnmclhizqygfsjoxtvkwukr|zpacnmwlhizqygfsjoxzvkwudr|bpacpoelhqzqygfsjoxtvkwudr|bpacnlelhizqyzfsjoxtvkwukr"
let d3_input = d2_inputString.split(separator: "|").filter({ $0.count>0 }).map {String($0)}

// - - - - -
// Part 1: Box checksum
//
// Scan the box titles and count those meeting the criteria.


func has2or3of( s:String ) -> (Bool,Bool) {
    // Determine whether a given string has exactly 2 or
    // exactly 3 of any letter.  Of course, we could generalize this to N
    // of a letter, but if we called hasNof twice we'd have to abstract
    // out the dictionary for shared use or build it twice
    
    // Build a dictionary of lettercounts
    var lettercounts : [Character : Int] = [:]
    s.forEach { if lettercounts[$0] != nil {
        lettercounts[$0] = lettercounts[$0]! + 1
    } else {
        lettercounts[$0] = 1
        }}
    // Check the dictionary for any entries with the desired number of counts
    let has2 = lettercounts.contains { (l,count) -> Bool in count == 2 }
    let has3 = lettercounts.contains { (l,count) -> Bool in count == 3 }
    return (has2,has3)
}

// Using the detector above, count matching strings
var count2 = 0
var count3 = 0

d3_input.forEach {
    let (has2,has3) = has2or3of(s: String($0))
    if has2 { count2 += 1 }
    if has3 { count3 += 1 }
}

// And multiply to get the checksum
print("Boxes with 2 of a letter \(count2), Boxes with 3 of a letter \(count3).  Checksum: \(count2 * count3)")


// - - - - -
// Part 2: Matching box pattern / finding 2 boxes that differ by only 1 letter
//
// Use brute-force pairwise comparison O(n**2) to find strings differing by one letter.
//
// If I had to do this more often I think I'd use a distance vector of bit vector to
// quickly discard obvious mismatches, or perhaps double-hash based on substrings
// to make this scale O(n).  But the brute-force runtime is <100ms for this input already.

for (i1,s1) in d3_input.enumerated() {
    for (i2,s2) in d3_input.enumerated() {
        if i1 >= i2 { continue }
        
        let s1bytes = Array(s1.utf8)
        let s2bytes = Array(s2.utf8)
        
        var mismatches = 0;
        for (stringi,c) in s1bytes.enumerated() {
            if s2bytes[stringi] != c {
                mismatches += 1
                if mismatches > 1 { break }
            }
        }
        
        if mismatches == 1 {
            var patternbytes : [UInt8] = []
            for (stringi,c) in s1bytes.enumerated() {
                if s2bytes[stringi] == c {
                    patternbytes.append(c);
                } else {
                    patternbytes.append(Array(".".utf8)[0])
                }
            }
            let pattern = String(decoding: patternbytes, as: UTF8.self)
            print("Found just 1 char mismatch between \(s1) and \(s2), pattern is \(pattern)")
        }
    }
}


