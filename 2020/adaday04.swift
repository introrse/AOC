//
//  main.swift
//  Day 4
//
//  Created by Jasonc on 12/4/20.
//  Copyright © 2020 Ada. All rights reserved.
//

import Foundation

let input = try! String(contentsOfFile: "/Users/jasonc/Documents/Dev/adventcode/2020/AdaDay04/input04.txt")

let passports = input.components(separatedBy: "\n\n").filter({$0.lengthOfBytes(using: String.Encoding.utf8) > 0})

func passportverification () -> Int {
    var verifiedpassports = 0
    for m in passports {
        if m.contains("byr:") && m.contains("iyr:") && m.contains("eyr:") && m.contains("hgt:") && m.contains("hcl:") && m.contains("pid:") && m.contains("ecl:") {
            verifiedpassports += 1
        }
    }
    return verifiedpassports
}

print(passportverification())

func betterpassportverification () -> Int {
    var validpassportcount = 0
    for m in passports {
        if m.contains("byr:") && m.contains("iyr:") && m.contains("eyr:") && m.contains("hgt:") && m.contains("hcl:") && m.contains("pid:") && m.contains("ecl:") {
        } else {
            continue
        }
        var zwischenschritt3 : [String] = []
        var fieldcomponents : [String:String] = [:]
        zwischenschritt3.append(contentsOf: m.components( separatedBy: [":"," ","\n"]))
        for q in 0..<zwischenschritt3.count {
            if q % 2 == 1 {
                fieldcomponents[zwischenschritt3[q-1]] = zwischenschritt3[q]
            }
        }
        if Int(fieldcomponents["byr"]!)! < 1920 || Int(fieldcomponents["byr"]!)! > 2002 {
            continue
        }
        if Int(fieldcomponents["iyr"]!)! < 2010 || Int(fieldcomponents["iyr"]!)! > 2020 {
            continue
        }
        if Int(fieldcomponents["eyr"]!)! < 2020 || Int(fieldcomponents["eyr"]!)! > 2030 {
            continue
        }
        let heightvalue = parse(string: fieldcomponents["hgt"]!, using: "^(\\d+)(cm|in)$")
        if heightvalue.count != 3 {
            continue
        }
        if heightvalue[2] == "cm" {
            let cm = Int(heightvalue[1])!
            if cm < 150 || cm > 193 {
                continue
            }
        }
        if heightvalue[2] == "in" {
            let inch = Int(heightvalue[1])!
                if inch < 59 || inch > 76 {
                continue
            }
        }
        let haircolot = parse(string: fieldcomponents["hcl"]!, using: "^#[0-9a-f]{6}$")
        if haircolot.count != 1 {
            continue
        }
        let eyecolot = parse(string: fieldcomponents["ecl"]!, using: "^(amb|blu|brn|gry|grn|hzl|oth)$")
        if eyecolot.count != 2{
            continue
        }
        let pid = parse(string: fieldcomponents["pid"]!, using: "^\\d{9}$")
        if pid.count != 1 {
            continue
        }
        validpassportcount += 1
        print(fieldcomponents["eyr"]!)
    }
    return validpassportcount
}

print(betterpassportverification())



