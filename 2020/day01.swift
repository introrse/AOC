// AOC 2020 Day 1 solution in Swift
// Jason Campbell

import Foundation

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Utility to time a block

func time_block( _ label : String = "", block : () -> Void ) -> Void {
    let begin = clock()
    block();
    print( label + ((label.count>0) ? ": " : "") + "Elapsed time \(Double(clock() - begin) / Double(CLOCKS_PER_SEC))s\n");
}

// ---------------------------------------------------------------------
// Solution starts here

let input = try! String(contentsOfFile: "/Users/jasonc/Documents/Dev/adventcode/2020/day01.txt")
let numbers = input.split(separator: "\n").map { Int($0)! }

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Part A

time_block {
    for i in 0..<numbers.count {
        let a = numbers[i]
        
        for j in i+1..<numbers.count {
            let b = numbers[j]
            if a + b == 2020 {
                print("\(a) x \(b) = \(a*b)")
            }
        }
    }
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Part B

time_block {
    for i in 0..<numbers.count {
        let a = numbers[i]
        
        for j in i+1..<numbers.count {
            let b = numbers[j]
            
            for k in j+1..<numbers.count {
                let c = numbers[k]
                if a + b + c == 2020 {
                    print("\(a) x \(b) x \(c) = \(a*b*c)")
                }
            }
        }
    }
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Results (-Ospeed)

// 1224 x 796 = 974304
// Elapsed time 0.000104s
//
// 332 x 858 x 830 = 236430480
// Elapsed time 0.001654s

