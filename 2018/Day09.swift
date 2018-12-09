
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Day 9 -- The marbles game

// Example data
let examples = [ [10, 1618, 8317],
                 [13, 7999, 146373],
                 [17, 1104, 2764],
                 [21, 6111, 54718],
                 [30, 5807, 37305],
]


let part1game = [476,71431]

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Initial solution, using an array.  See more below

func playgame( with numplayers : Int, until maxmarble : Int, verbose : Bool ) -> Int {
    var marbles : [Int] = [0]
    var current : Int = 0
    var players : [[Int]] = Array<[Int]>(repeating: [], count: numplayers )
    
    func insert( marblenumber m : Int, by player : Int )  {
        //print("insert", m, marbles)
        if m < 24 { assert(m == marbles.count) }
        if m==0 {
            marbles.append(m);
            current = 0
        } else if m % 23 == 0 {
            players[player].append(m)
            var counterclockwise7index = (current-7) % marbles.count
            if counterclockwise7index < 0 { counterclockwise7index += marbles.count }
            let cc7 = marbles.remove(at: counterclockwise7index)
            players[player].append(cc7)
            current = counterclockwise7index
            if verbose { print("Player \(player) kept marbles \(m) and \(cc7)") }
            
        } else {
            //let clockwise1index = (current + 1) % marbles.count
            let clockwise2index = (current + 2) % marbles.count
            marbles.insert( m, at: clockwise2index )
            current = clockwise2index
        }
    }
    
    func formatgame() -> String {
        return marbles.enumerated().map { i,m in (i==current) ? "("+String(m)+")" : String(m) }.joined(separator: " ")
    }
    
    var p = 0
    for m in 1..<maxmarble {
        insert(marblenumber: m, by: p)
        if verbose { print("["+String(p+1)+"]", formatgame()) }
        p = (p+1) % numplayers
    }
    
    let winningmarbles = players.min { (a, b) -> Bool in a.reduce(0, +) > b.reduce(0,+) }
    let winningscore = winningmarbles?.reduce(0,+)
    print("Game with \(numplayers) played until \(maxmarble), winning score was \(winningscore!)")
    return winningscore!
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Better solution, using a linked-list.  See more below

class Marble {
    var value : Int = 0
    var prev  : Marble?
    var next  : Marble?
    
    init(_ m:Int) { value = m }
}

func playgame_linkedlist( with numplayers : Int, until maxmarble : Int, verbose : Bool ) -> Int {
    
    var first = Marble(0)
    first.next = first
    first.prev = first
    
    var current : Marble = first
    
    var players : [[Int]] = Array<[Int]>(repeating: [], count: numplayers )
    
    func insert( marblenumber m : Int, by player : Int )  {
        if m % 23 == 0 {
            players[player].append(m)
            for _ in 0..<7 { current = current.prev! }
            players[player].append(current.value)
            
            current.prev!.next = current.next!
            current.next!.prev = current.prev!
            current = current.next!
            if verbose { print("Player \(player) kept marbles \(m) and \(current.value)") }
            
        } else {
            current = current.next!
            let new = Marble(m)
            new.next = current.next
            new.prev = current
            current.next!.prev = new
            current.next = new
            current = new
        }
    }
    
    func formatgame() -> String {
        var s = ""
        var m = current.next!
        s += "(" + String(current.value) + ")"
        while m !== current {
            s += " "+String(m.value)+" "
            m = m.next!
        }
        return s
    }
    
    var p = 0
    for m in 1..<maxmarble {
        insert(marblenumber: m, by: p)
        if verbose { print("["+String(p+1)+"]", formatgame()) }
        p = (p+1) % numplayers
    }
    
    let winningmarbles = players.min { (a, b) -> Bool in a.reduce(0, +) > b.reduce(0,+) }
    let winningscore = winningmarbles?.reduce(0,+)
    print("Game with \(numplayers) played until \(maxmarble), winning score was \(winningscore!)")
    return winningscore!
}



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - -
// Part 1: Who is the winner with 476, 71431 points

_ = playgame_linkedlist(with: 9, until: 25, verbose: true)

for gd in examples {
    _ = playgame_linkedlist(with: gd[0], until: gd[1], verbose: false)
}

print("\nPart I answer")
_ = playgame_linkedlist(with: part1game[0], until: part1game[1], verbose: false)

// Took me 58 minutes to code Part I, not sure why so long.


// - - - - -
// Part 2:

print("\nPart II answer (note this is going to take tens of minutes to finish)")
_ = playgame_linkedlist(with: part1game[0], until: 100*part1game[1], verbose: false)


// Took 30 seconds to code Part II, but runtime was a problem.
//
// I wrote the original solution using arrays as in playgame() above.  Runtime on
// part I was sub-second, but part II took many tens of minutes.  I had to leave, so
// I just let it run and when I came back 2.5h later it was done.
//
// While I was away, I realized this was supposed to be a linked-list problem, so
// I recoded using a linked-list in playgame_linkedlist() above.  The small problem
// runtimes are slightly longer, but the 100x problem is much quicker -- <10s.



