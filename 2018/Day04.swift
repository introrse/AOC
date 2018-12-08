//
//  Day04.swift
//  
//
//  Created by Jason on 12/8/18.
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Day 4 -- Sneaking past the (hopefully sleeping) guard

let stringInput = """
[1518-06-02 23:58] Guard #179 begins shift
[1518-09-18 00:43] wakes up
[1518-06-06 00:10] falls asleep
[1518-05-12 00:52] wakes up
[1518-07-02 00:39] wakes up
[1518-07-21 23:50] Guard #2917 begins shift
[1518-09-22 00:47] wakes up
[1518-09-09 00:31] wakes up
[1518-07-21 00:15] wakes up
[1518-07-30 00:43] wakes up
[1518-10-08 00:52] wakes up
[1518-07-26 23:57] Guard #1051 begins shift
[1518-07-17 00:00] Guard #2273 begins shift
[1518-08-18 00:24] falls asleep
[1518-09-08 00:02] falls asleep
[1518-08-19 00:00] Guard #2917 begins shift
[1518-08-21 00:01] Guard #251 begins shift
[1518-08-08 00:39] falls asleep
[1518-09-08 23:57] Guard #2273 begins shift
[1518-08-17 23:46] Guard #2971 begins shift
[1518-06-30 00:04] falls asleep
[1518-07-10 00:00] Guard #1783 begins shift
[1518-10-30 00:03] Guard #2657 begins shift
[1518-10-20 00:45] wakes up
[1518-11-06 00:13] wakes up
[1518-04-12 00:02] Guard #2273 begins shift
[1518-08-13 00:57] wakes up
[1518-07-03 00:48] falls asleep
[1518-11-07 00:33] wakes up
[1518-08-30 00:30] wakes up
[1518-05-15 23:56] Guard #1811 begins shift
[1518-07-09 00:26] wakes up
[1518-07-05 23:58] Guard #1051 begins shift
[1518-06-10 00:47] falls asleep
[1518-06-29 00:40] falls asleep
[1518-07-25 00:52] wakes up
[1518-08-01 00:27] falls asleep
[1518-06-15 00:53] wakes up
[1518-05-24 00:15] wakes up
[1518-06-15 00:50] falls asleep
[1518-07-15 00:25] wakes up
[1518-08-22 00:20] falls asleep
[1518-04-26 00:18] falls asleep
[1518-10-10 00:43] falls asleep
[1518-07-20 23:51] Guard #2467 begins shift
[1518-06-17 00:02] Guard #3467 begins shift
[1518-09-06 00:01] Guard #3319 begins shift
[1518-10-21 00:02] Guard #751 begins shift
[1518-07-11 00:09] falls asleep
[1518-06-02 00:11] falls asleep
[1518-05-23 00:57] wakes up
[1518-06-26 00:22] falls asleep
[1518-11-21 00:07] falls asleep
[1518-09-11 00:07] falls asleep
[1518-07-17 00:35] wakes up
[1518-06-27 00:45] wakes up
[1518-08-06 00:21] falls asleep
[1518-08-11 00:51] falls asleep
[1518-11-02 00:19] falls asleep
[1518-07-01 00:51] wakes up
[1518-10-05 00:45] wakes up
[1518-05-17 00:21] falls asleep
[1518-04-18 23:56] Guard #643 begins shift
[1518-11-22 00:44] wakes up
[1518-07-23 00:50] wakes up
[1518-11-17 23:56] Guard #1783 begins shift
[1518-07-22 00:46] wakes up
[1518-06-29 00:25] falls asleep
[1518-11-13 00:00] Guard #179 begins shift
[1518-11-10 23:51] Guard #499 begins shift
[1518-10-05 00:00] Guard #751 begins shift
[1518-11-11 00:53] wakes up
[1518-09-17 00:26] wakes up
[1518-06-21 00:49] wakes up
[1518-09-12 00:06] falls asleep
[1518-04-18 00:25] falls asleep
[1518-09-28 00:59] wakes up
[1518-04-13 00:09] falls asleep
[1518-06-01 00:36] wakes up
[1518-07-23 23:56] Guard #643 begins shift
[1518-09-09 00:54] wakes up
[1518-11-06 00:19] falls asleep
[1518-06-27 00:21] falls asleep
[1518-11-17 00:46] wakes up
[1518-07-07 00:47] falls asleep
[1518-11-01 00:02] Guard #457 begins shift
[1518-08-22 00:37] wakes up
[1518-08-29 00:56] wakes up
[1518-10-12 00:04] Guard #3167 begins shift
[1518-04-13 00:41] falls asleep
[1518-07-15 00:32] falls asleep
[1518-06-11 00:47] wakes up
[1518-05-23 00:41] falls asleep
[1518-09-16 23:46] Guard #2657 begins shift
[1518-08-29 23:50] Guard #251 begins shift
[1518-10-06 23:51] Guard #2657 begins shift
[1518-11-18 00:56] falls asleep
[1518-05-24 00:43] wakes up
[1518-11-18 00:59] wakes up
[1518-04-18 00:13] wakes up
[1518-06-19 00:01] Guard #499 begins shift
[1518-05-31 00:40] wakes up
[1518-10-15 00:56] falls asleep
[1518-08-03 00:30] wakes up
[1518-04-12 00:55] falls asleep
[1518-10-23 00:00] Guard #2971 begins shift
[1518-06-26 00:52] wakes up
[1518-07-15 00:00] Guard #1051 begins shift
[1518-07-08 00:26] falls asleep
[1518-08-25 00:46] wakes up
[1518-06-09 00:45] wakes up
[1518-04-25 00:46] wakes up
[1518-10-02 00:28] falls asleep
[1518-04-23 23:57] Guard #1051 begins shift
[1518-06-18 00:03] Guard #1783 begins shift
[1518-05-04 00:04] Guard #2657 begins shift
[1518-09-25 00:15] falls asleep
[1518-06-01 00:00] Guard #643 begins shift
[1518-05-06 00:54] falls asleep
[1518-09-16 00:01] Guard #3319 begins shift
[1518-11-16 00:00] Guard #3467 begins shift
[1518-10-22 00:31] wakes up
[1518-09-07 00:00] Guard #2273 begins shift
[1518-06-22 23:47] Guard #643 begins shift
[1518-09-11 00:45] wakes up
[1518-05-06 00:01] Guard #751 begins shift
[1518-10-15 00:21] falls asleep
[1518-04-10 00:59] wakes up
[1518-09-04 00:30] falls asleep
[1518-08-20 00:11] falls asleep
[1518-11-12 00:25] falls asleep
[1518-10-25 23:57] Guard #911 begins shift
[1518-10-01 00:46] falls asleep
[1518-07-08 00:52] falls asleep
[1518-09-01 00:27] falls asleep
[1518-07-19 00:30] wakes up
[1518-09-25 00:57] falls asleep
[1518-05-21 00:41] falls asleep
[1518-10-26 00:39] wakes up
[1518-06-24 23:50] Guard #3319 begins shift
[1518-08-18 00:51] wakes up
[1518-08-25 23:56] Guard #1783 begins shift
[1518-09-29 00:00] Guard #179 begins shift
[1518-09-10 00:48] wakes up
[1518-06-14 00:10] falls asleep
[1518-05-20 00:38] falls asleep
[1518-06-02 00:56] wakes up
[1518-10-06 00:43] falls asleep
[1518-05-16 00:48] wakes up
[1518-04-15 00:00] Guard #179 begins shift
[1518-09-24 23:59] Guard #2467 begins shift
[1518-09-21 00:49] wakes up
[1518-09-21 00:19] falls asleep
[1518-07-17 00:51] wakes up
[1518-04-27 00:41] wakes up
[1518-05-09 00:39] falls asleep
[1518-08-12 00:49] falls asleep
[1518-09-15 00:37] falls asleep
[1518-05-03 00:16] falls asleep
[1518-08-16 23:49] Guard #2477 begins shift
[1518-11-10 00:45] wakes up
[1518-07-26 00:32] falls asleep
[1518-08-06 00:01] Guard #499 begins shift
[1518-07-30 00:26] falls asleep
[1518-09-14 00:01] Guard #643 begins shift
[1518-09-29 00:59] wakes up
[1518-04-18 00:48] wakes up
[1518-09-29 00:08] falls asleep
[1518-10-29 00:46] falls asleep
[1518-07-19 00:55] wakes up
[1518-07-06 00:38] falls asleep
[1518-09-05 00:22] falls asleep
[1518-04-13 00:26] wakes up
[1518-11-22 23:46] Guard #251 begins shift
[1518-04-06 00:55] wakes up
[1518-08-12 00:06] falls asleep
[1518-04-28 00:01] Guard #2971 begins shift
[1518-04-28 00:43] falls asleep
[1518-05-09 00:33] falls asleep
[1518-09-16 00:59] wakes up
[1518-08-21 00:16] falls asleep
[1518-09-02 00:10] falls asleep
[1518-08-19 00:23] falls asleep
[1518-05-16 00:19] falls asleep
[1518-06-23 00:39] wakes up
[1518-04-18 00:57] wakes up
[1518-09-22 00:17] wakes up
[1518-06-15 00:04] falls asleep
[1518-10-13 00:00] Guard #1811 begins shift
[1518-10-18 00:02] Guard #751 begins shift
[1518-10-26 00:24] falls asleep
[1518-05-10 00:53] falls asleep
[1518-06-22 00:01] Guard #3319 begins shift
[1518-11-13 00:56] falls asleep
[1518-07-14 00:16] falls asleep
[1518-05-21 00:57] wakes up
[1518-10-06 00:50] wakes up
[1518-06-21 00:36] falls asleep
[1518-04-08 00:47] wakes up
[1518-09-06 00:10] falls asleep
[1518-10-02 00:58] wakes up
[1518-05-28 00:03] falls asleep
[1518-09-15 00:58] wakes up
[1518-07-28 00:02] Guard #2477 begins shift
[1518-10-02 00:35] wakes up
[1518-08-19 00:33] wakes up
[1518-07-14 00:27] wakes up
[1518-08-31 00:33] falls asleep
[1518-05-06 00:58] wakes up
[1518-05-24 00:10] falls asleep
[1518-05-20 00:01] Guard #643 begins shift
[1518-04-12 00:32] falls asleep
[1518-09-16 00:17] falls asleep
[1518-05-27 00:16] falls asleep
[1518-11-17 00:15] falls asleep
[1518-08-28 00:08] wakes up
[1518-08-29 00:13] falls asleep
[1518-09-20 00:23] falls asleep
[1518-05-25 00:46] falls asleep
[1518-05-26 00:59] wakes up
[1518-07-28 00:16] falls asleep
[1518-08-28 00:36] wakes up
[1518-11-16 00:58] wakes up
[1518-10-06 00:59] wakes up
[1518-05-13 00:40] falls asleep
[1518-09-29 00:35] wakes up
[1518-11-06 00:04] falls asleep
[1518-04-09 23:57] Guard #619 begins shift
[1518-05-09 23:58] Guard #2467 begins shift
[1518-09-17 23:59] Guard #619 begins shift
[1518-11-08 00:51] wakes up
[1518-05-29 00:37] wakes up
[1518-05-01 00:44] falls asleep
[1518-04-14 00:03] falls asleep
[1518-10-09 00:59] wakes up
[1518-09-14 23:59] Guard #911 begins shift
[1518-07-21 00:38] falls asleep
[1518-08-11 00:00] Guard #2273 begins shift
[1518-05-17 00:57] wakes up
[1518-04-24 00:54] wakes up
[1518-11-07 00:39] falls asleep
[1518-04-15 00:39] falls asleep
[1518-10-28 00:57] wakes up
[1518-05-24 23:59] Guard #3319 begins shift
[1518-11-07 00:58] wakes up
[1518-10-28 00:08] falls asleep
[1518-08-27 23:53] Guard #2273 begins shift
[1518-05-14 00:02] Guard #251 begins shift
[1518-09-01 00:00] Guard #751 begins shift
[1518-09-20 00:08] falls asleep
[1518-09-23 00:05] falls asleep
[1518-04-09 00:23] falls asleep
[1518-09-25 00:58] wakes up
[1518-07-21 00:59] wakes up
[1518-08-08 00:40] wakes up
[1518-05-13 00:04] Guard #1783 begins shift
[1518-08-23 00:48] wakes up
[1518-08-26 00:46] falls asleep
[1518-10-13 00:12] falls asleep
[1518-05-29 00:25] falls asleep
[1518-09-18 00:16] falls asleep
[1518-07-16 00:10] falls asleep
[1518-06-10 00:52] wakes up
[1518-06-29 00:30] wakes up
[1518-08-06 23:48] Guard #2477 begins shift
[1518-11-18 00:44] falls asleep
[1518-11-19 00:16] wakes up
[1518-11-07 00:12] falls asleep
[1518-05-19 00:46] wakes up
[1518-11-18 00:49] wakes up
[1518-10-21 00:38] falls asleep
[1518-04-20 00:42] falls asleep
[1518-09-21 00:30] wakes up
[1518-07-20 00:25] falls asleep
[1518-07-12 00:18] falls asleep
[1518-07-02 00:50] falls asleep
[1518-05-31 00:02] falls asleep
[1518-06-05 00:51] wakes up
[1518-10-28 23:58] Guard #2477 begins shift
[1518-07-14 00:59] wakes up
[1518-10-30 00:34] wakes up
[1518-10-19 00:00] Guard #1783 begins shift
[1518-07-13 00:00] Guard #751 begins shift
[1518-07-21 00:57] falls asleep
[1518-10-01 00:42] wakes up
[1518-08-29 00:04] Guard #643 begins shift
[1518-08-01 23:58] Guard #457 begins shift
[1518-11-08 00:02] Guard #179 begins shift
[1518-11-06 00:36] wakes up
[1518-10-03 00:57] wakes up
[1518-11-15 00:29] falls asleep
[1518-05-05 00:44] falls asleep
[1518-08-02 00:42] falls asleep
[1518-10-16 00:42] wakes up
[1518-05-05 00:01] Guard #1811 begins shift
[1518-10-27 00:21] wakes up
[1518-05-09 00:34] wakes up
[1518-05-01 00:03] Guard #1783 begins shift
[1518-09-08 00:50] wakes up
[1518-11-01 23:56] Guard #2477 begins shift
[1518-07-03 23:59] Guard #1811 begins shift
[1518-05-23 23:58] Guard #3319 begins shift
[1518-11-09 00:41] falls asleep
[1518-07-12 00:59] wakes up
[1518-06-30 00:54] wakes up
[1518-09-16 00:20] wakes up
[1518-11-22 00:09] falls asleep
[1518-08-12 00:55] wakes up
[1518-07-09 00:44] wakes up
[1518-06-27 23:51] Guard #1051 begins shift
[1518-09-25 23:59] Guard #1051 begins shift
[1518-07-05 00:58] wakes up
[1518-09-27 00:02] Guard #617 begins shift
[1518-11-11 00:05] falls asleep
[1518-07-28 00:56] wakes up
[1518-08-25 00:33] falls asleep
[1518-05-23 00:50] wakes up
[1518-07-07 00:35] wakes up
[1518-08-22 00:45] wakes up
[1518-10-22 00:23] wakes up
[1518-08-11 00:10] falls asleep
[1518-05-30 00:47] falls asleep
[1518-05-28 23:57] Guard #2467 begins shift
[1518-10-22 00:15] falls asleep
[1518-04-10 00:29] falls asleep
[1518-04-11 00:00] Guard #1783 begins shift
[1518-07-31 00:53] wakes up
[1518-11-20 00:02] falls asleep
[1518-05-15 00:48] falls asleep
[1518-10-06 00:44] wakes up
[1518-08-24 00:33] wakes up
[1518-06-03 00:44] wakes up
[1518-06-16 00:51] falls asleep
[1518-07-04 23:58] Guard #179 begins shift
[1518-11-20 00:53] wakes up
[1518-09-24 00:03] Guard #179 begins shift
[1518-05-30 00:04] Guard #2917 begins shift
[1518-10-02 23:56] Guard #643 begins shift
[1518-07-23 00:42] falls asleep
[1518-06-09 23:56] Guard #251 begins shift
[1518-07-13 00:46] falls asleep
[1518-09-23 00:38] falls asleep
[1518-04-16 00:01] falls asleep
[1518-11-15 00:41] wakes up
[1518-08-04 00:02] Guard #2971 begins shift
[1518-08-03 00:02] Guard #2477 begins shift
[1518-09-02 00:45] wakes up
[1518-11-05 23:53] Guard #2467 begins shift
[1518-08-16 00:59] wakes up
[1518-06-18 00:49] wakes up
[1518-09-05 00:01] Guard #499 begins shift
[1518-07-13 00:54] wakes up
[1518-04-27 00:57] falls asleep
[1518-09-29 00:41] falls asleep
[1518-05-16 00:32] wakes up
[1518-05-15 00:02] falls asleep
[1518-09-30 00:53] wakes up
[1518-05-23 00:07] falls asleep
[1518-08-04 00:43] falls asleep
[1518-07-26 00:11] falls asleep
[1518-10-27 23:58] Guard #1051 begins shift
[1518-04-15 00:46] wakes up
[1518-07-10 00:43] falls asleep
[1518-11-03 00:55] wakes up
[1518-05-22 00:51] wakes up
[1518-07-21 00:42] wakes up
[1518-09-22 00:52] falls asleep
[1518-11-09 00:12] falls asleep
[1518-07-07 00:57] falls asleep
[1518-09-06 00:29] wakes up
[1518-06-25 00:35] wakes up
[1518-07-02 23:59] Guard #2657 begins shift
[1518-10-01 00:03] Guard #251 begins shift
[1518-06-28 00:04] falls asleep
[1518-05-10 00:29] wakes up
[1518-06-14 23:51] Guard #1811 begins shift
[1518-08-28 00:21] falls asleep
[1518-06-29 00:00] Guard #1811 begins shift
[1518-10-23 23:58] Guard #179 begins shift
[1518-08-26 00:57] wakes up
[1518-06-13 00:56] wakes up
[1518-10-01 00:59] wakes up
[1518-04-08 00:35] falls asleep
[1518-07-07 00:58] wakes up
[1518-09-22 00:59] wakes up
[1518-04-27 00:54] wakes up
[1518-08-27 00:00] Guard #3467 begins shift
[1518-08-13 23:56] Guard #457 begins shift
[1518-11-03 00:00] Guard #1811 begins shift
[1518-05-21 23:59] Guard #3467 begins shift
[1518-11-14 00:35] falls asleep
[1518-06-13 00:24] falls asleep
[1518-05-18 23:52] Guard #2917 begins shift
[1518-09-30 00:42] wakes up
[1518-04-16 23:59] Guard #751 begins shift
[1518-10-08 00:34] falls asleep
[1518-08-21 00:35] falls asleep
[1518-11-01 00:47] wakes up
[1518-04-24 00:33] falls asleep
[1518-09-02 23:57] Guard #2917 begins shift
[1518-10-24 00:28] falls asleep
[1518-06-12 00:30] wakes up
[1518-05-19 00:27] wakes up
[1518-05-30 00:41] falls asleep
[1518-09-14 00:18] falls asleep
[1518-05-19 00:00] falls asleep
[1518-07-25 00:31] wakes up
[1518-04-22 00:00] Guard #619 begins shift
[1518-05-17 23:56] Guard #499 begins shift
[1518-08-09 00:59] wakes up
[1518-06-01 23:59] Guard #3167 begins shift
[1518-09-22 23:52] Guard #643 begins shift
[1518-07-27 00:27] falls asleep
[1518-04-30 00:24] wakes up
[1518-04-06 00:09] falls asleep
[1518-06-20 00:29] falls asleep
[1518-06-12 00:33] falls asleep
[1518-08-09 00:53] falls asleep
[1518-05-11 00:59] wakes up
[1518-11-08 00:28] falls asleep
[1518-06-11 00:01] falls asleep
[1518-05-25 00:55] wakes up
[1518-06-03 00:52] wakes up
[1518-09-23 00:31] wakes up
[1518-05-01 00:39] wakes up
[1518-05-05 00:53] wakes up
[1518-04-28 23:57] Guard #643 begins shift
[1518-07-17 23:59] Guard #2657 begins shift
[1518-10-10 00:49] wakes up
[1518-10-30 00:30] falls asleep
[1518-09-12 00:33] wakes up
[1518-05-17 00:03] Guard #179 begins shift
[1518-06-03 00:25] falls asleep
[1518-07-03 00:51] wakes up
[1518-07-12 00:57] falls asleep
[1518-11-19 00:35] falls asleep
[1518-10-16 00:11] falls asleep
[1518-11-16 00:22] falls asleep
[1518-11-08 00:56] falls asleep
[1518-10-20 00:07] falls asleep
[1518-09-10 00:25] wakes up
[1518-08-23 00:02] Guard #2467 begins shift
[1518-05-09 00:57] wakes up
[1518-08-10 00:28] wakes up
[1518-10-21 00:43] falls asleep
[1518-11-22 00:04] Guard #3319 begins shift
[1518-04-20 00:43] wakes up
[1518-07-09 00:40] falls asleep
[1518-10-29 00:29] wakes up
[1518-05-04 00:45] wakes up
[1518-05-08 00:02] Guard #457 begins shift
[1518-11-21 00:48] falls asleep
[1518-07-09 00:05] falls asleep
[1518-05-30 00:43] wakes up
[1518-08-11 00:31] wakes up
[1518-11-19 00:02] Guard #2971 begins shift
[1518-06-24 00:01] Guard #2467 begins shift
[1518-11-10 00:57] wakes up
[1518-06-20 00:58] wakes up
[1518-11-09 00:28] wakes up
[1518-04-09 00:50] wakes up
[1518-09-11 00:00] Guard #1783 begins shift
[1518-10-07 23:53] Guard #2971 begins shift
[1518-04-06 00:00] Guard #499 begins shift
[1518-06-08 00:01] Guard #617 begins shift
[1518-11-04 00:47] wakes up
[1518-07-28 00:20] wakes up
[1518-10-27 00:53] wakes up
[1518-05-15 00:32] wakes up
[1518-08-07 00:04] falls asleep
[1518-07-19 00:35] falls asleep
[1518-09-28 00:00] Guard #1783 begins shift
[1518-05-08 00:48] falls asleep
[1518-05-24 00:52] falls asleep
[1518-05-13 00:45] wakes up
[1518-08-20 00:03] Guard #499 begins shift
[1518-06-05 00:03] Guard #179 begins shift
[1518-09-02 00:41] falls asleep
[1518-09-17 00:56] wakes up
[1518-04-11 00:06] falls asleep
[1518-10-07 00:28] wakes up
[1518-08-27 00:49] wakes up
[1518-09-07 00:24] wakes up
[1518-06-25 00:48] falls asleep
[1518-09-02 00:00] Guard #3319 begins shift
[1518-08-10 00:26] falls asleep
[1518-08-14 00:21] falls asleep
[1518-07-12 00:00] Guard #2477 begins shift
[1518-08-05 00:03] Guard #251 begins shift
[1518-05-07 00:00] Guard #571 begins shift
[1518-06-03 23:51] Guard #2477 begins shift
[1518-10-12 00:58] wakes up
[1518-09-22 00:00] Guard #3467 begins shift
[1518-11-19 23:46] Guard #3167 begins shift
[1518-04-21 00:03] Guard #619 begins shift
[1518-08-21 00:56] wakes up
[1518-10-02 00:01] Guard #2971 begins shift
[1518-05-18 00:23] falls asleep
[1518-10-14 00:57] wakes up
[1518-11-19 00:39] falls asleep
[1518-08-12 00:14] wakes up
[1518-04-19 00:56] wakes up
[1518-11-11 00:46] falls asleep
[1518-08-07 23:58] Guard #911 begins shift
[1518-10-06 00:02] Guard #643 begins shift
[1518-04-25 00:41] falls asleep
[1518-08-08 23:57] Guard #251 begins shift
[1518-07-25 00:00] falls asleep
[1518-06-22 00:29] falls asleep
[1518-11-12 00:55] wakes up
[1518-04-11 00:48] wakes up
[1518-10-16 23:58] Guard #571 begins shift
[1518-05-01 00:35] falls asleep
[1518-08-15 00:08] falls asleep
[1518-09-24 00:14] falls asleep
[1518-07-30 00:21] wakes up
[1518-11-21 00:19] wakes up
[1518-11-16 23:56] Guard #911 begins shift
[1518-06-25 23:57] Guard #3167 begins shift
[1518-05-16 00:46] falls asleep
[1518-06-29 00:52] wakes up
[1518-10-06 00:48] falls asleep
[1518-05-27 00:04] Guard #2917 begins shift
[1518-04-18 00:54] falls asleep
[1518-04-15 00:54] falls asleep
[1518-08-12 23:56] Guard #3467 begins shift
[1518-10-05 00:41] falls asleep
[1518-07-17 00:13] falls asleep
[1518-06-20 23:56] Guard #2273 begins shift
[1518-04-24 00:17] falls asleep
[1518-04-16 00:55] wakes up
[1518-09-19 00:13] wakes up
[1518-07-06 00:29] wakes up
[1518-04-07 00:55] wakes up
[1518-05-19 00:44] falls asleep
[1518-11-05 00:42] wakes up
[1518-07-11 00:00] Guard #179 begins shift
[1518-04-29 23:59] Guard #457 begins shift
[1518-06-14 00:45] wakes up
[1518-06-19 23:58] Guard #2917 begins shift
[1518-05-26 00:16] falls asleep
[1518-08-31 00:38] wakes up
[1518-07-18 00:55] wakes up
[1518-05-23 00:54] falls asleep
[1518-07-08 23:46] Guard #3467 begins shift
[1518-06-06 00:01] Guard #643 begins shift
[1518-07-01 00:48] falls asleep
[1518-05-18 00:24] wakes up
[1518-09-03 00:29] falls asleep
[1518-06-18 00:34] falls asleep
[1518-04-24 00:27] wakes up
[1518-06-12 00:54] wakes up
[1518-09-19 00:08] falls asleep
[1518-10-25 00:22] falls asleep
[1518-05-24 00:58] wakes up
[1518-10-11 00:00] Guard #571 begins shift
[1518-08-14 00:27] wakes up
[1518-09-04 00:47] wakes up
[1518-07-18 00:33] falls asleep
[1518-09-10 00:00] Guard #2273 begins shift
[1518-05-22 23:59] Guard #3467 begins shift
[1518-05-01 00:45] wakes up
[1518-05-04 00:17] falls asleep
[1518-09-05 00:43] wakes up
[1518-06-17 00:47] wakes up
[1518-08-24 23:58] Guard #619 begins shift
[1518-04-20 00:02] Guard #3319 begins shift
[1518-10-21 00:39] wakes up
[1518-09-01 00:39] falls asleep
[1518-07-08 00:40] wakes up
[1518-09-09 00:42] falls asleep
[1518-07-17 00:47] falls asleep
[1518-07-08 00:00] Guard #643 begins shift
[1518-09-01 00:31] wakes up
[1518-11-09 00:43] wakes up
[1518-04-09 00:00] Guard #751 begins shift
[1518-07-06 00:09] falls asleep
[1518-04-23 00:06] falls asleep
[1518-08-15 00:49] wakes up
[1518-07-24 00:58] wakes up
[1518-05-20 00:15] wakes up
[1518-06-29 23:50] Guard #2467 begins shift
[1518-11-23 00:03] falls asleep
[1518-10-18 00:24] falls asleep
[1518-08-24 00:32] falls asleep
[1518-10-09 00:32] falls asleep
[1518-09-20 00:36] wakes up
[1518-09-19 00:52] wakes up
[1518-06-16 00:46] wakes up
[1518-11-08 00:58] wakes up
[1518-07-29 00:50] falls asleep
[1518-10-15 23:57] Guard #1811 begins shift
[1518-08-21 00:30] wakes up
[1518-06-25 00:56] wakes up
[1518-05-06 00:44] wakes up
[1518-11-12 00:04] Guard #499 begins shift
[1518-05-20 00:59] wakes up
[1518-08-20 00:52] wakes up
[1518-08-22 00:02] Guard #1783 begins shift
[1518-09-17 00:04] falls asleep
[1518-09-17 00:39] falls asleep
[1518-05-06 00:16] falls asleep
[1518-04-06 00:43] falls asleep
[1518-11-04 00:42] falls asleep
[1518-07-10 00:48] wakes up
[1518-08-14 23:58] Guard #2273 begins shift
[1518-08-05 00:34] wakes up
[1518-06-10 23:54] Guard #3167 begins shift
[1518-11-19 00:36] wakes up
[1518-07-28 00:53] falls asleep
[1518-10-03 00:39] falls asleep
[1518-05-27 23:52] Guard #251 begins shift
[1518-04-19 00:38] falls asleep
[1518-09-20 00:13] wakes up
[1518-06-24 00:55] wakes up
[1518-04-13 23:54] Guard #179 begins shift
[1518-08-27 00:39] falls asleep
[1518-05-20 00:11] falls asleep
[1518-06-07 00:28] wakes up
[1518-10-08 00:03] falls asleep
[1518-10-31 00:32] wakes up
[1518-05-11 00:01] Guard #179 begins shift
[1518-11-02 00:28] wakes up
[1518-10-22 00:01] Guard #251 begins shift
[1518-11-02 00:51] falls asleep
[1518-06-10 00:56] falls asleep
[1518-08-11 00:52] wakes up
[1518-05-14 00:13] wakes up
[1518-11-10 00:55] falls asleep
[1518-08-07 00:59] wakes up
[1518-06-21 00:27] wakes up
[1518-09-12 00:02] Guard #3319 begins shift
[1518-10-23 00:49] wakes up
[1518-11-03 23:58] Guard #1783 begins shift
[1518-10-20 00:03] Guard #3167 begins shift
[1518-04-18 00:04] falls asleep
[1518-07-06 23:57] Guard #3467 begins shift
[1518-08-03 00:28] falls asleep
[1518-11-12 00:20] wakes up
[1518-07-20 00:52] wakes up
[1518-08-23 00:39] falls asleep
[1518-04-21 00:23] falls asleep
[1518-11-03 00:08] falls asleep
[1518-07-26 00:57] wakes up
[1518-04-17 00:31] falls asleep
[1518-06-14 00:04] Guard #1783 begins shift
[1518-09-14 00:45] wakes up
[1518-06-16 00:58] wakes up
[1518-06-19 00:41] wakes up
[1518-06-19 00:28] falls asleep
[1518-09-09 00:18] falls asleep
[1518-08-10 00:01] Guard #457 begins shift
[1518-05-26 00:00] Guard #1783 begins shift
[1518-09-12 23:46] Guard #3467 begins shift
[1518-06-12 00:25] falls asleep
[1518-11-07 00:00] Guard #3467 begins shift
[1518-07-22 00:31] falls asleep
[1518-04-17 00:59] wakes up
[1518-08-13 00:32] falls asleep
[1518-05-08 00:52] wakes up
[1518-05-12 00:11] falls asleep
[1518-06-01 00:31] falls asleep
[1518-05-01 23:58] Guard #1783 begins shift
[1518-05-14 00:47] wakes up
[1518-05-02 23:56] Guard #457 begins shift
[1518-07-30 00:03] Guard #3167 begins shift
[1518-05-30 23:51] Guard #911 begins shift
[1518-09-25 00:54] wakes up
[1518-07-04 00:52] wakes up
[1518-05-22 00:27] falls asleep
[1518-05-10 00:55] wakes up
[1518-04-14 00:30] wakes up
[1518-04-26 00:04] Guard #2917 begins shift
[1518-05-24 00:27] falls asleep
[1518-07-02 00:57] wakes up
[1518-07-01 23:48] Guard #3467 begins shift
[1518-11-09 00:03] Guard #619 begins shift
[1518-11-03 00:17] falls asleep
[1518-07-19 23:57] Guard #457 begins shift
[1518-09-21 00:02] Guard #3167 begins shift
[1518-04-30 00:21] falls asleep
[1518-07-31 00:25] falls asleep
[1518-10-27 00:02] Guard #1783 begins shift
[1518-09-13 00:49] wakes up
[1518-09-20 00:00] Guard #499 begins shift
[1518-07-01 00:04] Guard #499 begins shift
[1518-08-15 23:50] Guard #2467 begins shift
[1518-05-03 00:25] wakes up
[1518-06-08 23:48] Guard #1811 begins shift
[1518-04-12 00:57] wakes up
[1518-08-16 00:00] falls asleep
[1518-09-02 00:13] wakes up
[1518-11-19 00:14] falls asleep
[1518-10-25 00:52] wakes up
[1518-04-23 00:20] wakes up
[1518-05-28 00:08] wakes up
[1518-08-07 00:54] wakes up
[1518-09-19 00:48] falls asleep
[1518-05-16 00:58] wakes up
[1518-04-14 00:40] falls asleep
[1518-05-02 00:45] wakes up
[1518-06-13 00:44] wakes up
[1518-05-14 23:47] Guard #2467 begins shift
[1518-11-13 00:58] wakes up
[1518-05-11 23:59] Guard #2477 begins shift
[1518-09-01 00:40] wakes up
[1518-06-07 00:12] falls asleep
[1518-10-15 00:00] Guard #751 begins shift
[1518-11-02 00:52] wakes up
[1518-05-16 00:54] falls asleep
[1518-10-25 00:01] Guard #2657 begins shift
[1518-10-06 00:55] falls asleep
[1518-07-12 00:53] wakes up
[1518-10-27 00:41] falls asleep
[1518-11-06 00:54] falls asleep
[1518-06-06 23:57] Guard #2477 begins shift
[1518-11-09 23:56] Guard #619 begins shift
[1518-04-21 00:51] wakes up
[1518-11-19 00:58] wakes up
[1518-04-29 00:38] falls asleep
[1518-08-28 00:03] falls asleep
[1518-04-28 00:52] wakes up
[1518-11-01 00:15] falls asleep
[1518-10-31 00:27] falls asleep
[1518-10-02 00:49] falls asleep
[1518-04-07 00:08] falls asleep
[1518-10-14 00:03] Guard #2467 begins shift
[1518-10-01 00:29] falls asleep
[1518-09-28 00:38] falls asleep
[1518-06-10 00:18] falls asleep
[1518-07-25 00:35] falls asleep
[1518-06-28 00:35] wakes up
[1518-11-14 00:51] wakes up
[1518-06-21 00:14] falls asleep
[1518-07-16 00:39] wakes up
[1518-10-31 00:02] Guard #179 begins shift
[1518-04-14 00:57] wakes up
[1518-07-11 00:59] wakes up
[1518-05-14 00:11] falls asleep
[1518-04-15 00:58] wakes up
[1518-09-03 00:30] wakes up
[1518-07-21 00:03] falls asleep
[1518-11-10 00:26] falls asleep
[1518-09-26 00:29] falls asleep
[1518-11-17 00:27] wakes up
[1518-09-23 00:51] wakes up
[1518-07-07 00:10] falls asleep
[1518-08-30 00:01] falls asleep
[1518-08-06 00:26] wakes up
[1518-10-08 00:18] wakes up
[1518-07-01 00:27] wakes up
[1518-05-09 00:03] Guard #2467 begins shift
[1518-06-24 00:08] falls asleep
[1518-10-09 23:59] Guard #1051 begins shift
[1518-09-22 00:09] falls asleep
[1518-05-21 00:00] Guard #1783 begins shift
[1518-06-04 00:52] wakes up
[1518-10-08 23:58] Guard #1051 begins shift
[1518-09-07 23:52] Guard #619 begins shift
[1518-08-20 00:15] wakes up
[1518-06-11 00:53] falls asleep
[1518-11-12 00:16] falls asleep
[1518-05-30 00:56] wakes up
[1518-07-24 00:24] falls asleep
[1518-07-02 00:04] falls asleep
[1518-06-16 00:25] falls asleep
[1518-10-14 00:06] falls asleep
[1518-04-12 00:51] wakes up
[1518-08-01 00:00] Guard #3167 begins shift
[1518-11-21 00:53] wakes up
[1518-08-05 00:08] falls asleep
[1518-05-10 00:25] falls asleep
[1518-07-05 00:45] falls asleep
[1518-07-14 00:34] falls asleep
[1518-04-15 23:46] Guard #179 begins shift
[1518-09-30 00:45] falls asleep
[1518-07-27 00:31] wakes up
[1518-06-10 00:44] wakes up
[1518-04-27 00:58] wakes up
[1518-07-19 00:18] falls asleep
[1518-06-04 00:02] falls asleep
[1518-06-22 00:55] wakes up
[1518-07-30 00:20] falls asleep
[1518-08-04 00:46] wakes up
[1518-08-02 00:59] wakes up
[1518-06-13 00:49] falls asleep
[1518-04-22 00:28] falls asleep
[1518-11-14 23:57] Guard #3319 begins shift
[1518-08-26 00:09] falls asleep
[1518-06-13 00:04] Guard #179 begins shift
[1518-11-06 00:55] wakes up
[1518-06-09 00:00] falls asleep
[1518-05-14 00:23] falls asleep
[1518-09-22 00:21] falls asleep
[1518-10-10 00:31] wakes up
[1518-10-29 00:09] falls asleep
[1518-04-12 23:58] Guard #3167 begins shift
[1518-10-13 00:42] wakes up
[1518-08-18 00:03] wakes up
[1518-05-02 00:26] falls asleep
[1518-04-23 00:01] Guard #499 begins shift
[1518-08-20 00:25] falls asleep
[1518-08-22 00:42] falls asleep
[1518-04-17 23:53] Guard #2273 begins shift
[1518-08-23 23:58] Guard #179 begins shift
[1518-04-24 23:59] Guard #1783 begins shift
[1518-04-29 00:56] wakes up
[1518-10-19 00:16] falls asleep
[1518-09-30 00:04] falls asleep
[1518-09-21 00:47] falls asleep
[1518-06-06 00:42] wakes up
[1518-08-26 00:38] wakes up
[1518-07-26 00:18] wakes up
[1518-06-25 00:04] falls asleep
[1518-07-13 23:56] Guard #2467 begins shift
[1518-09-10 00:31] falls asleep
[1518-09-13 00:05] falls asleep
[1518-10-19 00:28] wakes up
[1518-10-04 00:52] wakes up
[1518-10-04 00:51] falls asleep
[1518-10-29 00:53] wakes up
[1518-07-29 00:53] wakes up
[1518-11-21 00:02] Guard #2273 begins shift
[1518-10-27 00:17] falls asleep
[1518-05-23 00:28] wakes up
[1518-04-27 00:03] Guard #2273 begins shift
[1518-06-05 00:49] falls asleep
[1518-07-22 23:56] Guard #619 begins shift
[1518-09-07 00:22] falls asleep
[1518-07-29 00:00] Guard #499 begins shift
[1518-07-16 00:03] Guard #2273 begins shift
[1518-11-03 00:13] wakes up
[1518-11-13 23:59] Guard #911 begins shift
[1518-08-30 23:59] Guard #643 begins shift
[1518-07-22 00:07] wakes up
[1518-05-11 00:55] falls asleep
[1518-09-24 00:41] wakes up
[1518-06-11 00:58] wakes up
[1518-09-16 00:29] falls asleep
[1518-04-22 00:53] wakes up
[1518-09-18 23:57] Guard #2273 begins shift
[1518-04-26 00:51] wakes up
[1518-06-16 00:04] Guard #457 begins shift
[1518-10-24 00:56] wakes up
[1518-06-23 00:05] falls asleep
[1518-05-27 00:39] wakes up
[1518-08-17 00:36] wakes up
[1518-07-08 00:53] wakes up
[1518-07-04 00:13] falls asleep
[1518-10-18 00:34] wakes up
[1518-10-10 00:06] falls asleep
[1518-08-01 00:46] wakes up
[1518-07-06 00:53] wakes up
[1518-04-13 00:51] wakes up
[1518-07-30 23:56] Guard #619 begins shift
[1518-07-15 00:20] falls asleep
[1518-07-25 23:57] Guard #179 begins shift
[1518-07-19 00:04] Guard #911 begins shift
[1518-10-15 00:43] wakes up
[1518-09-26 00:58] wakes up
[1518-06-17 00:31] falls asleep
[1518-06-12 00:01] Guard #911 begins shift
[1518-05-15 00:58] wakes up
[1518-04-06 23:59] Guard #1783 begins shift
[1518-09-03 23:57] Guard #619 begins shift
[1518-04-27 00:27] falls asleep
[1518-07-01 00:20] falls asleep
[1518-09-29 23:50] Guard #911 begins shift
[1518-06-10 00:58] wakes up
[1518-10-12 00:52] falls asleep
[1518-04-06 00:32] wakes up
[1518-08-18 00:01] falls asleep
[1518-07-15 00:45] wakes up
[1518-11-04 23:57] Guard #2657 begins shift
[1518-06-03 00:50] falls asleep
[1518-10-07 00:04] falls asleep
[1518-10-15 00:58] wakes up
[1518-08-07 00:57] falls asleep
[1518-08-17 00:01] falls asleep
[1518-06-26 23:58] Guard #3467 begins shift
[1518-07-22 00:03] falls asleep
[1518-10-23 00:42] falls asleep
[1518-10-04 00:03] Guard #619 begins shift
[1518-11-17 00:45] falls asleep
[1518-11-23 00:26] wakes up
[1518-09-10 00:07] falls asleep
[1518-08-12 00:04] Guard #1051 begins shift
[1518-06-15 00:43] wakes up
[1518-11-05 00:07] falls asleep
[1518-07-07 00:53] wakes up
[1518-04-07 23:58] Guard #2657 begins shift
[1518-04-27 00:53] falls asleep
[1518-10-21 00:52] wakes up
[1518-11-11 00:18] wakes up
[1518-10-22 00:26] falls asleep
[1518-07-24 23:47] Guard #3319 begins shift
"""

// - - - - - Data import routines for day 4
//

// Parse a single guard event line

func parseGuardLogLine(_ s:String) -> (
    // These are the returned tuple fields
    String /* day */,
    Int    /* mins from midnight*/,
    Bool   /* woke up */,
    Bool   /* fell asleep */,
    Bool   /* began shift */,
    Int    /* Guard # if began shift */)
{
    // Example input: [1518-06-02 23:58] Guard #179 begins shift
    
    let groups1 = exec(regex: try! NSRegularExpression(pattern: "\\[([-0-9]+) (\\d+):(\\d+)\\] (.+)\\s*$"),
                       against: s)
    assert( groups1.count == 5 )
    
    let day = groups1[1]
    let hh = Int(groups1[2])!
    let mm = Int(groups1[3])!
    let rest = groups1[4]
    
    let minsfrommidnight = mm + ( (hh==23) ? -60 : 0 )
    
    switch (rest) {
    case "wakes up":
        return (day, minsfrommidnight, true, false, false, -1);
        
    case "falls asleep":
        return (day, minsfrommidnight, false, true, false, -1);
        
    default:
        let groups2 = exec(regex: try! NSRegularExpression(pattern: "Guard #(\\d+) begins shift"),
                           against: rest)
        assert( groups2.count == 2 )
        return (day, minsfrommidnight, false, false, true, Int(groups2[1])!)
    }
}


let logLines = stringInput.split(separator: "\n").filter {$0.count>0} .map {String($0)} .sorted()

// Tests
//print("Log \(logStrings[0])")
//print(parseGuardLogLine(logStrings[0]))
//
//print("Log \(logStrings[2])")
//print(parseGuardLogLine(logStrings[2]))



// - - - - -
// Part 1: Which guard sleeps most and when do they sleep most often?

var sleeprec : [Int:[Int]] = [:]     // one array of Ints per guard
var sleeptotal : [Int:Int] = [:]     // ont Int per guard
var currentguard = -1
var fellasleeptime = -1

// Walking thru the sorted lines in a state machine, we make a sleep record
// for each guard, by minute of the hour across all the sampled days. (sleeprec)
//
// We also track the total amount of sleep per guard (sleeptotal)
//
// Since log lines depend upon previous/subsequent lines to make any
// sense, we add some assert() checks so the program will blow up
// and warn us if something seems amiss, such as a guard waking up
// before they go to sleep.

for logline in logLines {
    let( _, minute, didwake, didsleep, didstart, guardnum ) = parseGuardLogLine(logline)
    
    // As a sanity-check, insist wake/sleep records all occur between midnight
    // and 12:59.  (though "started shift" can occur before midnight)
    assert( (!didsleep && !didwake) || (minute >= 0) )
    
    if didstart {
        currentguard = guardnum
        
    } else {
        assert(currentguard>0)  // Sanity check: Must have a guard start before any sleep/wake
        if didsleep {
            fellasleeptime = minute
            
        } else {
            assert(fellasleeptime >= 0)  // Sanity check: Must sleep before waking
            
            if didwake {
                assert( fellasleeptime < minute )  // Sanity check: sleep & wake times must make sense
                
                // Add this period of sleep to guard's total sleeping minutes,
                sleeptotal[currentguard] = (sleeptotal[currentguard] ?? 0) + (minute - fellasleeptime)
                
                // Mark off these minutes in the guard's sleep record
                // including initializing the guard's record if they don't have one yet
                var rec = sleeprec[currentguard] ?? Array<Int>(repeating: 0, count: 60)
                for m in fellasleeptime..<minute {
                    rec[m] = rec[m] + 1
                }
                sleeprec[currentguard] = rec
                
            } else {
                assert(false)  // If this runs, a line was found that we don't recognize
            }
        }
    }
}

// Now sort guard id numbers by the total sleeping per guard
let ids_sorted = sleeptotal.keys.sorted { sleeptotal[$0]! > sleeptotal[$1]! }

var first = true  // Print stats for top guard

// Print the whole list of guards so we can see things worked properly,
// including the stats and problem answer (product) for the sleepiest guard

for id in ids_sorted {
    let rec = sleeprec[id]!
    
    // Some sleep-minute sounds exceed 9, so we use this to turn them into A-Z
    // so our grid display isn't messed up by two-digit numbers
    func sleepToChar(_ i : Int) -> String {
        return (i<10) ? String(i) : String(UnicodeScalar(64+i)!)
    }
    print( String(format: "G#%04d : ",id), rec.map({sleepToChar($0)}).joined(), " total=",sleeptotal[id]! )
    //    print("G#\(String(format:"%02d",id)) : ", rec.map({sleepToChar($0)}).joined(), " total=",sleeptotal[id]!);
    
    // For the first (sleepiest) guard only, find & print  the maximally-sleepy minute
    if first {
        first = false
        var maxm = -1
        var maxval = 0
        for m in 0..<60 { if rec[m] > maxval { maxval = rec[m]; maxm = m; } }
        print("  max val of \(maxval) occurs at minute \(maxm)")
        print("  product of max minute number and guard number is \(maxm * id)")
    }
}



// - - - - -
// Part II: Which guard is most frequently asleep on a single minute

// We can reuse the sleep records above, and even the same max-finding code we
// used above for just the top guard, but in this case we do it for all the
// guards so we can figure out the max across all guards of the max sleep minute
// of each guard

var outermax_id = -1
var outermax_amount = 0
var outermax_minute = -1

for id in ids_sorted {
    let rec = sleeprec[id]!
    
    var max_m = -1
    var max_amt = 0
    for m in 0..<60 { if rec[m] > max_amt { max_amt = rec[m]; max_m = m; } }
    
    if max_amt > outermax_amount {
        outermax_amount = max_amt
        outermax_minute = max_m
        outermax_id = id
    }
}

print("\nPart II:")
print("Guard \(outermax_id) slept \(outermax_amount) at \(outermax_minute).  Product of minute and guard number is \(outermax_id * outermax_minute)")

