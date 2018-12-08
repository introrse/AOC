//
//  Day07.swift
//  
//
/// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

import Foundation

// Swift regular expression results are difficult to use, so we need some helpers

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

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Day 7 --

let shortStringInput = """
Step C must be finished before step A can begin.
Step C must be finished before step F can begin.
Step A must be finished before step B can begin.
Step A must be finished before step D can begin.
Step B must be finished before step E can begin.
Step D must be finished before step E can begin.
Step F must be finished before step E can begin.
"""

let stringInput = """
Step B must be finished before step X can begin.
Step H must be finished before step P can begin.
Step Y must be finished before step J can begin.
Step Z must be finished before step I can begin.
Step T must be finished before step U can begin.
Step R must be finished before step C can begin.
Step S must be finished before step J can begin.
Step W must be finished before step J can begin.
Step C must be finished before step L can begin.
Step L must be finished before step F can begin.
Step E must be finished before step G can begin.
Step A must be finished before step G can begin.
Step V must be finished before step X can begin.
Step U must be finished before step O can begin.
Step P must be finished before step F can begin.
Step O must be finished before step I can begin.
Step I must be finished before step F can begin.
Step K must be finished before step F can begin.
Step J must be finished before step F can begin.
Step G must be finished before step X can begin.
Step M must be finished before step X can begin.
Step F must be finished before step Q can begin.
Step Q must be finished before step N can begin.
Step D must be finished before step N can begin.
Step X must be finished before step N can begin.
Step I must be finished before step Q can begin.
Step U must be finished before step I can begin.
Step D must be finished before step X can begin.
Step B must be finished before step W can begin.
Step L must be finished before step N can begin.
Step U must be finished before step X can begin.
Step U must be finished before step J can begin.
Step C must be finished before step V can begin.
Step G must be finished before step N can begin.
Step S must be finished before step K can begin.
Step Q must be finished before step D can begin.
Step J must be finished before step X can begin.
Step V must be finished before step K can begin.
Step Z must be finished before step A can begin.
Step L must be finished before step M can begin.
Step H must be finished before step D can begin.
Step V must be finished before step Q can begin.
Step L must be finished before step V can begin.
Step S must be finished before step D can begin.
Step C must be finished before step Q can begin.
Step S must be finished before step L can begin.
Step E must be finished before step V can begin.
Step E must be finished before step P can begin.
Step C must be finished before step I can begin.
Step O must be finished before step K can begin.
Step H must be finished before step V can begin.
Step M must be finished before step F can begin.
Step K must be finished before step N can begin.
Step C must be finished before step X can begin.
Step G must be finished before step D can begin.
Step E must be finished before step U can begin.
Step R must be finished before step L can begin.
Step K must be finished before step G can begin.
Step W must be finished before step C can begin.
Step B must be finished before step L can begin.
Step L must be finished before step J can begin.
Step U must be finished before step D can begin.
Step I must be finished before step G can begin.
Step Q must be finished before step X can begin.
Step B must be finished before step M can begin.
Step T must be finished before step P can begin.
Step G must be finished before step Q can begin.
Step Y must be finished before step U can begin.
Step M must be finished before step D can begin.
Step P must be finished before step I can begin.
Step I must be finished before step K can begin.
Step O must be finished before step M can begin.
Step H must be finished before step Z can begin.
Step V must be finished before step M can begin.
Step P must be finished before step J can begin.
Step B must be finished before step U can begin.
Step E must be finished before step X can begin.
Step M must be finished before step Q can begin.
Step W must be finished before step L can begin.
Step O must be finished before step J can begin.
Step I must be finished before step X can begin.
Step J must be finished before step N can begin.
Step Y must be finished before step S can begin.
Step E must be finished before step D can begin.
Step M must be finished before step N can begin.
Step E must be finished before step O can begin.
Step I must be finished before step D can begin.
Step V must be finished before step N can begin.
Step R must be finished before step X can begin.
Step Z must be finished before step O can begin.
Step O must be finished before step X can begin.
Step I must be finished before step J can begin.
Step S must be finished before step E can begin.
Step E must be finished before step Q can begin.
Step J must be finished before step Q can begin.
Step H must be finished before step Y can begin.
Step T must be finished before step G can begin.
Step S must be finished before step A can begin.
Step P must be finished before step K can begin.
Step A must be finished before step D can begin.
Step B must be finished before step P can begin.
"""

// - - - - - Data import
//

let constraints = exec(regex: "Step (\\S+) must be finished before step (\\S+) can begin.$",
                       againstMultipleLines: stringInput)

//print(constraints[0])
//print(constraints[1])


// - - - - -
// Part 1:

var predecessors = Dictionary<String,Set<String>>()

// Because Swift lacks autovivification, we explicitly
// create empty sets for all the listed successor nodes
constraints.forEach( {predecessors[$0[1]] = []} )

// Make sure no-dependency nodes mentioned as
// predecessors are captured as empty sets too, since
// we will use this structure to find eligible jobs to
// work
constraints.forEach( {predecessors[$0[0]] = []} )

// Then insert listed dependencies
constraints.forEach( {predecessors[$0[1]]?.insert($0[0])})

print("Found \(constraints.count) constraints imposed on \(predecessors.count) nodes")

var done : [String] = []   // becomes the ordered list of tasks completed

while predecessors.count > 0 {
    // Next task is the first in lex order with an empty predecessor set
    let next = predecessors.keys.sorted().first(where: {predecessors[$0]!.count == 0} )!
    done.append(next)
    predecessors.removeValue(forKey: next)
    // Filter out this task from every other predecessor set
    predecessors.forEach( { predecessors[$0.key] = $0.value.subtracting([next]) } )
}

print("Part I sequence is", done.joined())


// - - - - -
// Part 2:

print("\n")  // two newlines between part 1 and 2

// Rebuild the predecessors tree, since we used it destructively
constraints.forEach( {predecessors[$0[1]] = []} )
constraints.forEach( {predecessors[$0[0]] = []} )
constraints.forEach( {predecessors[$0[1]]?.insert($0[0])})

var tick = 0                         // current simulation time
var workfinish = [String:Int]()      // task done time by worker
var working    = [String:String]()   // task being worked by worker

// I and 4 elves are working tasks in parallel, and we all start
// out done at time=0
workfinish["I"] = 0
workfinish["Elf A"] = 0
workfinish["Elf B"] = 0
workfinish["Elf C"] = 0
workfinish["Elf D"] = 0

// Define a helper to compute completion time by task letter
func tasktime( _ s : String ) -> Int {
    let letternum = Int((s.first?.unicodeScalars.first?.value)!) - 64
    return 60 + letternum
}

//print("A =",tasktime("A"))
//print("Z =",tasktime("Z"))

while predecessors.count > 0 {
    
    // When workers complete tasks, clear those tasks' successors to proceed
    let idleworkers = workfinish.filter( {$0.value<=tick} ).keys.sorted()
    for w in idleworkers {
        if let wdone = working[w] {
            predecessors.forEach( { predecessors[$0.key] = $0.value.subtracting([wdone]) } )
            working.removeValue(forKey: w)
        }
    }
    
    // Try to assign available workers to any workable jobs
    for w in idleworkers {
        if predecessors.count == 0 { break }  // bail out when all work done
        
        // Find next unworked task with satisfied deps, if any
        if let next = predecessors.keys.sorted().first(where: { task in predecessors[task]!.count == 0 }) {
            
            // Deque the task so don't schedule it again
            predecessors.removeValue(forKey: next)
            
            // Schedule the worker and compute completion time
            working[w] = next
            workfinish[w] = tick + tasktime(next)
            print("\(w) will start \(next) at \(tick) and finish at \(workfinish[w]!)")
            
        // And if no task is available, break out of the worker-scheduling
        // loop so we can tick
        } else {
            break
        }
    }
    tick += 1
}

let lastfinish = workfinish.min { $0.value > $1.value }!

print("Part II: Last worker \(lastfinish.key) finished at \(lastfinish.value)")


// Attempted answers 423, 424, for Part II, both too low.  Revealed
// bug of not clearing successors to succeed if another worker couldn't
// be scheduled for a job at the moment a first worker was done.
//
// Finished just after midnight on Day 8 (not 7)


