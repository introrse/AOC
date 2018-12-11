import Foundation
// started about 8:45am

let examples = [[122,79,  57],
                [217,196,  39],
                [101,153,  71]]

// Extract the digits of a string
func digits( _ i:Int ) -> [Int] {
    return String(i).flatMap({Int(String($0))})
}

// Hash to memoize powerLevel computation.  Added this optimization
// after searching for the best grid at any size got slow.  It makes
// the overall calc over 20x faster
var plcache = [Int:Int]()

// Compute power level for a cell at x,y, with pack 'serial'
func powerLevel( x:Int, y:Int, serial:Int ) -> Int {
    let ci = (y*300) + x  // compute has index only once for memoization
    if let cpl = plcache[ci] { return cpl }  // shortcut from cache
    
    let rackid = x + 10
    let pl1 = rackid * y
    let pl2 = pl1 + serial
    let pl3 = pl2 * rackid
    let pl4 = (pl3 > 99) ? digits(pl3).reversed()[2] : 0
    
    plcache[ci] = pl4 - 5     // save final value to cache
    return pl4 - 5
}


for e in examples {
    print("Example \(e) => \(powerLevel( x:e[0], y:e[1], serial:e[2] ))")
}

// at 9am, done with PL calc, examples check out OK

// Started getting the "example grids" into my code to check them.
// at 9:12m realized this was a waste of time.  Those are just fragments
// from answers, and worthless. Dropped that code.

// Verified example grids by printing out my own answer grid nearby
// as follows
if false {
    for y in 0..<49 {
        var line = ""
        for x in 0..<37 {
            if x > 30 {
                line += String(format: "%4d", powerLevel(x: x, y: y, serial: 18) ) + " "
            }
        }
        print(line)
    }
}

// Compute power level across a size 'size' x 'size' box at x,y topleft
func gridPowerLevel( _ x:Int, _ y:Int, _ serial:Int, _ size:Int ) -> Int {
    var total = 0
    for i in x..<(x+size) {
        for j in y..<(y+size) {
            total += powerLevel(x: i, y: j, serial: serial)
        }
    }
    return total
}

// Find best 3x3 grid location.  This is part I
func bestGridLoc( _ serial : Int ) -> (Int,Int) {
    var maximum = 0
    var mx = -1
    var my = -1
    for tlx in 0..<295 {
        
        for tly in 0..<295 {
            let pl = gridPowerLevel(tlx, tly, serial, 3)
            if pl > maximum {
                print("New max \(pl) at \(tlx), \(tly)")
                maximum = pl
                mx = tlx
                my = tly
            }
        }
    }
    return (mx,my)
}

print("Working on Part I answer")
//_ = bestGridLoc(5791)


// Search for best at any size.  This is part II
func bestAnySize( _ serial : Int ) -> (Int,Int) {
    var maximum = -1000
    var mx = -1
    var my = -1
    // try working backwards
    //    for left in 0..<299 {
    //        let size = 300-left
    for size in 10..<280 {
        print("Checking size \(size):")
        for tlx in 0..<(300-size) {
            
            for tly in 0..<(300-size) {
                let pl = gridPowerLevel(tlx, tly, serial, size)
                if pl > maximum {
                    print("New max \(pl) at \(tlx), \(tly)")
                    maximum = pl
                    mx = tlx
                    my = tly
                }
            }
        }
    }
    return (mx,my)
}

print("\nWorking on Part II answer")
_ = bestAnySize(5791)

/*
 
 In Part II, runtime was getting long, interupted at size=10 to try other
 stuff. Max so far was 94 at 237, 281
 
 Ran backwards from size=300 and everything was deeply negative in PL,
 concluded large sizes weren't the answer.
 
 Added memoization for single-square PL calculation and it was much faster.
 
 Then compiled standalone, max optimization, removed runtime checks, and got
 another big boost.  Found the max within 3 seconds, though I let it run for
 20 s longer in case there was an even bigger max.
 
 Part II answer: (231,273,16)    (max 111 at 231, 273)
 
 done at 9:45am
 
 Performance timing after the fact:
 to ~65      to max     speed vs playground
 in a playground    420s                   ==1
 project            ~60s                   7x
 memoization        2-3s        44s        160x
 standalone                     7.7s       900x
 standalone, -O                 2.5s       2800x
 st., -O, no rtc   <0.5s        2.3s       3000x
 
 Resulting speedups vs playground execution:
 move code into a project, run conventionally    7x
 tweak software (memoization)                   24x
 run standalone outside debugger                 6x
 add -O optimization flag                        3x
 remove runtime checks                           1.08x
 
 */

