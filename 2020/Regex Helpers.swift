// ======================================================================
//  Regex Helpers.swift
//
// These are helper routines for using regular expressions within Swift
// code, especially for programming puzzles like Advent of Code
//
// let re = try! NSRegularExpression(pattern: "^(\\d+)-(\\d+) (.): (.*)$")
// let cap = parse(string: String(l), using: re)
// print( cap[1] )   // prints first captured group -- cap group 0 is whole match region
// ...
//
//  Created by Jason Campbell on 12/4/2020.
//

import Foundation

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Ignore this extension if all you want to know is how to use the regex helpers.
// The helpers start below.

extension NSTextCheckingResult {
    // Code to extract regex match groups.
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

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// The helpers are here...

/// Executes a regular expression with a string and returns the capture groups as an array of strings
/// - parameter string: The string against which the regex should be run
/// - parameter regex: A regular expression to run
func parse( string s : String, using regex: NSRegularExpression ) -> [String] {
    let range = NSRange(location: 0, length: s.count)
    let result = regex.firstMatch(in: s, options: [], range: range)
    return result!.groups(testedString:s)
}

/// Constructs a regex from a string and runs it against a string, returning the
/// capture groups as an array of strings
/// - parameter string: The string against which the regex should be run
/// - parameter regex: A regular expression to run
func parse( string s : String, using stringRegex: String ) -> [String] {
    let range = NSRange(location: 0, length: s.count)
    let regex = try! NSRegularExpression(pattern: stringRegex)
    let result = regex.firstMatch(in: s, options: [], range: range)
    return result!.groups(testedString:s)
}


// A convenience function that executes a regular expression on an array of strings,
// one at a time, and returns an array of capture group arrays.
//
// If you set 'expecting' to an integer value an error will be thrown for any string
// where the number of groups actually captured is not equal to 'expecting'.  This is
// useful for making sure you're not silently ignoring problems with your regex code.

/// Executes a regular experssion against an array of strings
func parse( stringArray lines : [String], using regex: NSRegularExpression, andExpect checkcount: Int = 0 ) -> [[String]] {
    var result : [[String]] = []
    for s in lines {
        var groups = parse(string: s, using: regex)
        assert( (checkcount == 0) || (checkcount == groups.count) )
        groups.removeFirst()
        result.append(groups)
    }
    return result
}

// For convenience with multiline string inputs, this second version splits the string by
// newlines, discards leading and trailing whitespace, and omits blank lines.

/// Executes a regular expression against a multiline string, first splitting the string on newline.
func parse( multilineString s: String, using regex: NSRegularExpression, andExpect checkcount: Int = 0 ) -> [[String]] {
    return parse( stringArray:
                    s.components(separatedBy: ["\n"," "])
                     .filter({$0.count>0})
                     .map({String($0).trimmingCharacters(in: .whitespaces)}),
                  using: regex )
}

// For even more AOC convenience, an additional signature is provided which also handles
// the regex construction

func parse( multilineString s:String, using regex: String, andExpect checkcount: Int = 0 ) -> [[String]] {
    return parse( multilineString: s,
                  using: try! NSRegularExpression(pattern: regex),
                  andExpect: checkcount )
}


