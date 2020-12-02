// AOC 2020 Day 2 in Swift
// Jason Campbell

import Foundation

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Swift won't subscript String because Unicode.  That's bad for AOC.  So we add it back.

extension StringProtocol {
    subscript (_ i:Int) -> Element {
        return self[index(startIndex, offsetBy: i)]
    }
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Utility to time a block

func time_block( _ label : String = "", block : () -> Void ) -> Void {
    let begin = clock()
    block();
    print( label + ((label.count>0) ? ": " : "") + "Elapsed time \(Double(clock() - begin) / Double(CLOCKS_PER_SEC))s\n");
}

// ---------------------------------------------------------------------
// Solution starts here
//
// Swift is so strongly typed that dealing with heterogenous data is a pain.
// As long as we have to do that, let's just go full OOP and make classes
// out of this day's puzzle input.
//
// Each line is a PasswordToCheck object, and each rule within the line is
// represented by a Rule object. (oops, Part II didn't add additional rules
// as I anticipated).

struct Rule {
    let min, max : Int
    let letter : Character
    
    init( _ s : String ) {
        let parts = s.components(separatedBy: " ")
        assert( parts.count == 2 )
        let rangeparts = parts[0].components(separatedBy: "-")
        assert( rangeparts.count == 2 )
        
        min = Int(rangeparts[0])!
        max = Int(rangeparts[1])!
        letter = parts[1].first!
    }
    
    func check1(password p:String) -> Bool {
        var count = 0
        for c in p {
            if c == letter {
                count += 1
            }
        }
        return (min <= count) && (count <= max);
    }
    
    func check2(password p:String) -> Bool {
        let a = p[min-1] == letter
        let b = p[max-1] == letter
        return (a && !b) || (!a && b)
    }
}

struct PasswordToCheck {
    let rule : Rule
    let password : String
    
    var check1 : Bool { rule.check1(password: password) }
    var check2 : Bool { rule.check2(password: password) }

    init( _ s : String ) {
        let parts = s.components(separatedBy: ": ")
        assert( parts.count == 2 )
        
        rule = Rule(parts[0])
        password = parts[1]
    }
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

let input = try! String(contentsOfFile: "/Users/jasonc/Documents/Dev/adventcode/2020/day02.txt")
let lines = input.split(separator: "\n")

time_block {
    let valid1 = lines.map { PasswordToCheck(String($0)) }.filter { $0.check1 }
    print("Part 1: Found \(lines.count) password lines, of which \(valid1.count) passed")
}

time_block {
    let valid2 = lines.map { PasswordToCheck(String($0)) }.filter { $0.check2 }
    print("Part 2: Found \(valid2.count) which passed second check")
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Results:  (build settings -Ospeed)
//
// Part 1: Found 1000 password lines, of which 416 passed
// Elapsed time 0.007809s
//
// Part 2: Found 688 which passed second check
// Elapsed time 0.006821s
