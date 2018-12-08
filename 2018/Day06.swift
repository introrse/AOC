//
//  Day06.swift
//  
//
//  Created by Jason on 12/8/18.
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

import Foundation

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Day 6 -- Figuring out which coordinate to head towards
//


// Smaller input for testing -- grid fits on screen and is computable in a playground
let stringInput = """
1, 1
1, 6
8, 3
3, 4
5, 5
8, 9
"""

// Distance limit for Part II.  32 for the small input above, 10000 for large input below
let part2distancelimit = 32 // 10000

// My large dataset for the problem
let LstringInput = """
81, 157
209, 355
111, 78
179, 211
224, 268
93, 268
237, 120
345, 203
72, 189
298, 265
190, 67
319, 233
328, 40
323, 292
125, 187
343, 186
46, 331
106, 350
247, 332
349, 145
217, 329
48, 177
105, 170
257, 166
225, 113
44, 98
358, 92
251, 209
206, 215
115, 283
206, 195
144, 157
246, 302
306, 157
185, 353
117, 344
251, 155
160, 48
119, 131
343, 349
223, 291
256, 89
133, 96
240, 271
322, 73
324, 56
149, 272
161, 107
172, 171
301, 291
"""


// - - - - - Data import routines for day 6
//

func parseCoord( _ s: String ) -> (Int,Int) {
    let parts = s.split(separator: ",")
    assert(parts.count == 2)
    
    let x = Int(parts[0])!
    
    var ystring = parts[1]
    ystring.removeFirst()
    let y = Int(ystring)!
    
    return (x,y)
}


// Split the inport and parse each line
let lineStrings = stringInput.split(separator: "\n").filter( {$0.count>0} );
var coords2 : [(Int,Int)] = []
lineStrings.forEach( {coords2.append(parseCoord(String($0)))} )
// for testing
//print(coords)

var coords = stringInput.split(separator: "\n").filter( {$0.count>0} ).map {parseCoord(String($0))}


// - - - - -
// Part 1: Find the coordinate furthest away from the other coords

// Establish how large a grid we need.  (one square larger than
// the convex hull of the coordinates just to make it easier to
// see effects and to make infinities clear)
let c0 = coords[0]
let minX = coords.reduce(c0.0,       {mark,x in min(mark,x.0)}) - 1
let minY = coords.reduce(c0.1,       {mark,x in min(mark,x.1)}) - 1
let maxX = coords.reduce(c0.0,       {mark,x in max(mark,x.0)}) + 1
let maxY = coords.reduce(c0.1,       {mark,x in max(mark,x.1)}) + 1
print("X-range \(minX)-\(maxX), Y-range \(minY)-\(maxY)")

// Set up a empty grid of this size
var grid = Array<Character>(repeating: " ", count: maxX * maxY)

// Define a grid index helper (get the linear index for a given X and Y)
func index( _ x : Int, _ y : Int ) -> Int { return ((y-minY)*maxX) + (x-minX) }

// Define a distance helper function to calculate Manhattan, aka "L1",
// distance between 2 points
func distance( _ x1 : Int, _ y1 : Int, _ x2 : Int, _ y2 : Int ) -> Int {
    return abs(x1 - x2) + abs(y1 - y2)
}

// Represent an integer with a character, starting with capital "A".
//
// This is somewhat complex because Swift strings are complex beasts.
//
// Note that in my input there are so many coordinates/regions that this
// endsup running through some symbols and into lowercase letters.  But
// the display is just for visualization/sanity checking so I don't think
// it's worth improving this algorithm
func regionCode( _ i : Int ) -> Character {
    return Character(UnicodeScalar("A".unicodeScalars.first!.value + UInt32(i))!)
}

// Maximum distance possible within our grid
// (Used for initializing one min-distance accumulator value)
let maxdist = (maxY-minY) + (maxX-minX) + 1

// For every grid square, compute distance to every given coordinate and
// keep track of:
//   1) the closest coordinate
//   2) distance to that closest coord
//   3) whether there were any ties at that closest distance.
for y in minY ..< maxY {
    for x in minX ..< maxX {
        var closestindex = -1
        var closestdist  = maxdist
        var tie = false
        
        for (i, c) in coords.enumerated() {
            let d = distance(x,y, c.0,c.1)
            if d < closestdist {
                closestindex = i   // #1
                closestdist  = d   // #2
                tie = false
            } else if d == closestdist {
                tie = true         // #3
            }
        }
        
        // For ties, mark the grid with a '.', otherwise use an
        // appropriate coding letter
        if tie {
            grid[index(x,y)] = "."
        } else {
            grid[index(x,y)] = regionCode(closestindex)
        }
    }
}

print("Done populating grid")

// Overload print() with a grid printing helper
func print( grid g : [Character] ) {
    if maxX - minX < 100 {
        for y in minY ..< maxY {
            var line = ""
            for x in minX ..< maxX {
                line.append(g[index(x,y)])
            }
            print(line)
        }
    } else {
        print("Skipping grid printout due to large dimensions")
    }
}

// When the grid is small enough, print it out for us to sanity-check
print(grid:grid)

// Figure which indices are infinite by walking the 4 boundaries
var infregions = Set<Character>()

for x in minX ..< maxX {
    infregions.insert(grid[index(x, minY)])    // top edge
    infregions.insert(grid[index(x, maxY-1)])  // bottom edge
}

for y in minY ..< maxY {
    infregions.insert(grid[index(minX, y)])    // left edge
    infregions.insert(grid[index(maxX-1, y)])  // right edge
}

// If we pick up a tie ("."), remove it
infregions.remove(".")

// Print out to sanity-check
let infregionlist = infregions.sorted()
print("Infinate regions: ",infregionlist)

// Walk the grid again and count square for each non-infinite regions
var regioncounts : [Character:Int] = [:]
for y in minY ..< maxY {
    for x in minX ..< maxX {
        let r = grid[index(x,y)]
        if !infregions.contains(r) {
            regioncounts[r] = (regioncounts[r] ?? 0) + 1
        }
    }
}

// Display the counts, where we will manually pull out the biggest
print("Region populations:", regioncounts.sorted(by: {$0.value > $1.value} ))


// - - - - -
// Part 2: Maximum area within a given total L1 distance to all given coords

print("\n")

// Create a whole new grid for this part
var grid2 = Array<Character>(repeating: " ", count: maxX * maxY)
// Keep track of how many squares are inside the limit
var sizeinsidelimit = 0

// For each grid square compute total distance to each given coordinate, and,
// if that total value is below our limit, mark it as in the region and
// increment our count of squares inside our limit.
for y in minY ..< maxY {
    for x in minX ..< maxX {
        var totaldistance = 0
        for (_, c) in coords.enumerated() {
            let d = distance(x,y, c.0,c.1)
            totaldistance += d
        }
        
        if totaldistance < part2distancelimit {
            grid2[index(x,y)] = "#"
            sizeinsidelimit += 1
            
        } else if totaldistance < part2distancelimit * 2 {
            grid2[index(x,y)] = "."
        }
    }
}

print("Done populating grid2")


// When the grid is small enough, print it out for us to sanity-check
print(grid: grid2)

// Print out the answer to part II
print("Included region size is \(sizeinsidelimit)")


// I finished Part I 741st at around 0:45 or so.
// I finished Part II 568th at around 1:00 or so.
