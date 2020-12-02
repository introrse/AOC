// AOC 2020 Day 2 in Swift
// Version B, using regular expressions.
//
// Jason Campbell

import Foundation

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Swift won't easily subscript String because Unicode.  That's bad for AOC.

extension StringProtocol {
    subscript (_ i:Int) -> Element {
        return self[index(startIndex, offsetBy: i)]
    }
}
extension String {
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

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Swift regular expression results are difficult to use, so we supply some helpers

extension NSTextCheckingResult {
    // From https://stackoverflow.com/questions/42789953/swift-3-how-do-i-extract-captured-groups-in-regular-expressions
    func groups(testedString:String) -> [String] {
        var groups = [String]()
        for i in  0 ..< self.numberOfRanges
        {
            let group = String(testedString[Range(self.range(at: i), in: testedString)!])
            groups.append(group)
        }
        return groups
    }
}

// Execute a regular expression and return the capture groups as an array of strings
func exec( regex re : NSRegularExpression, against s : String ) -> [String] {
    let range = NSRange(location: 0, length: s.count)
    let result = re.firstMatch(in: s, options: [], range: range)
    return result!.groups(testedString:s)
}

// Execute a regular expression on an array of strings and return the capture groups
// groups for each string.  If 'expecting' is set, throw an error unless the number
// of captured groups equals 'expecting'
//
// For convenience with multiline string inputs, a second signature is available which
// parses the string by newlines, discards leading and trailing whitespace, and omits blank lines.
//
// For even more AOC convenience, an additional signature is provided which also handles
// the regex construction
func exec( regex re : NSRegularExpression, against lines : [String], expecting checkcount: Int = 0 ) -> [[String]] {
    var result : [[String]] = []
    for s in lines {
        var groups = exec(regex: re, against: s)
        assert( (checkcount == 0) || (checkcount == groups.count) )
        groups.removeFirst()
        result.append(groups)
    }
    return result
}
func exec( regex re : NSRegularExpression, againstMultipleLines s : String, expecting checkcount: Int = 0 ) -> [[String]] {
    return exec(regex: re, against:
        s.split(separator: "\n").filter({$0.count>0}).map({String($0).trimmingCharacters(in: .whitespaces)}))
}
func exec( regex re : String, againstMultipleLines s : String, expecting checkcount: Int = 0 ) -> [[String]] {
    return exec(regex: try! NSRegularExpression(pattern: re),
                againstMultipleLines: s)
}



// ---------------------------------------------------------------------
// Solution starts here

let input = try! String(contentsOfFile: "/Users/jasonc/Documents/Dev/adventcode/2020/day02.txt")
let lines = input.split(separator: "\n")

// Part 1

time_block {
    var numok = 0
    let re = try! NSRegularExpression(pattern: "^(\\d+)-(\\d+) (.): (.*)$")
    
    for l in lines {
        let cap = exec(regex: re, against: String(l))
        let minimum = Int(cap[1])!
        let maximum = Int(cap[2])!
        let targetletter = String(cap[3]).first!
        let lettercount = cap[4].filter( {$0==targetletter} ).count
        if (minimum <= lettercount) && (lettercount <= maximum) {
            numok += 1
        }
    }
    print("Part 1: Found \(numok) valid passwords")
}

// Part 2

time_block {
    var numok = 0
    let re = try! NSRegularExpression(pattern: "^(\\d+)-(\\d+) (.): (.*)$")
    
    for l in lines {
        let cap = exec(regex: re, against: String(l))

        let i1 = Int(cap[1])! - 1
        let i2 = Int(cap[2])! - 1
        let targetletter = String(cap[3]).first!

        let a = (cap[4][i1] == targetletter)
        let b = (cap[4][i2] == targetletter)
        
        // No XOR in Swift.  Seriously!?!
        if (a && !b) || (!a && b) {
            numok += 1
        }
    }
    print("Part 2: Found \(numok) valid passwords")
}
