//
//  Day03.swift
//  
//
//  Created by Jason on 12/6/18.
//

import Foundation

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Day 3

let compactInput = "#1 @ 509,796: 18x15|#2 @ 724,606: 23x15|#3 @ 797,105: 10x13|#4 @ 925,483: 18x19|#5 @ 450,349: 20x26|#6 @ 71,733: 17x14|#7 @ 647,787: 26x19|#8 @ 893,66: 13x21|#9 @ 824,532: 15x20|#10 @ 247,335: 14x19|#11 @ 714,795: 23x26|#12 @ 218,265: 16x17|#13 @ 605,708: 12x24|#14 @ 835,294: 10x15|#15 @ 646,944: 6x13|#16 @ 96,568: 14x13|#17 @ 539,101: 29x23|#18 @ 738,320: 27x21|#19 @ 290,47: 11x27|#20 @ 808,149: 10x11|#21 @ 942,793: 11x15|#22 @ 763,745: 24x21|#23 @ 491,738: 26x11|#24 @ 594,414: 17x18|#25 @ 542,825: 22x19|#26 @ 480,951: 5x3|#27 @ 75,845: 20x20|#28 @ 619,64: 14x26|#29 @ 193,463: 25x24|#30 @ 220,74: 27x28|#31 @ 710,374: 22x21|#32 @ 534,449: 12x18|#33 @ 116,741: 14x26|#34 @ 801,574: 20x11|#35 @ 929,134: 28x29|#36 @ 515,771: 29x20|#37 @ 861,409: 10x29|#38 @ 99,503: 17x18|#39 @ 31,646: 21x29|#40 @ 859,156: 14x23|#41 @ 808,617: 29x12|#42 @ 129,300: 27x19|#43 @ 270,853: 19x21|#44 @ 722,391: 22x15|#45 @ 909,317: 13x12|#46 @ 183,545: 14x26|#47 @ 16,109: 20x18|#48 @ 527,491: 12x25|#49 @ 598,646: 11x26|#50 @ 797,559: 15x18|#51 @ 21,148: 22x16|#52 @ 257,649: 28x21|#53 @ 429,680: 12x18|#54 @ 10,201: 22x3|#55 @ 191,710: 17x10|#56 @ 468,779: 12x14|#57 @ 105,412: 27x21|#58 @ 502,452: 24x10|#59 @ 986,758: 12x16|#60 @ 917,931: 27x26|#61 @ 411,804: 27x21|#62 @ 851,844: 12x15|#63 @ 549,46: 28x29|#64 @ 679,743: 11x26|#65 @ 38,726: 12x17|#66 @ 680,281: 28x26|#67 @ 307,526: 22x10|#68 @ 113,444: 11x23|#69 @ 834,550: 29x18|#70 @ 611,32: 12x23|#71 @ 935,233: 29x10|#72 @ 891,437: 23x24|#73 @ 818,893: 17x16|#74 @ 916,289: 19x17|#75 @ 125,187: 25x18|#76 @ 102,867: 27x12|#77 @ 407,185: 12x16|#78 @ 719,406: 25x17|#79 @ 4,790: 20x20|#80 @ 506,166: 16x27|#81 @ 219,37: 12x14|#82 @ 584,555: 12x22|#83 @ 10,253: 14x27|#84 @ 60,665: 28x20|#85 @ 543,68: 23x10|#86 @ 429,58: 13x28|#87 @ 232,259: 23x27|#88 @ 124,728: 24x11|#89 @ 102,104: 19x17|#90 @ 596,5: 12x11|#91 @ 500,725: 18x21|#92 @ 627,194: 29x13|#93 @ 283,387: 29x26|#94 @ 927,589: 20x29|#95 @ 435,185: 15x21|#96 @ 277,879: 26x16|#97 @ 39,42: 24x23|#98 @ 735,316: 16x15|#99 @ 11,57: 26x15|#100 @ 402,849: 25x13|#101 @ 807,263: 22x19|#102 @ 347,205: 18x12|#103 @ 976,809: 10x16|#104 @ 164,15: 11x17|#105 @ 54,338: 18x24|#106 @ 326,636: 19x17|#107 @ 641,466: 26x20|#108 @ 441,897: 16x21|#109 @ 140,561: 12x21|#110 @ 968,470: 21x10|#111 @ 0,838: 18x21|#112 @ 902,275: 23x25|#113 @ 539,699: 14x28|#114 @ 222,938: 17x23|#115 @ 920,69: 21x27|#116 @ 829,555: 21x13|#117 @ 883,318: 11x23|#118 @ 144,268: 29x17|#119 @ 527,358: 12x14|#120 @ 134,807: 28x13|#121 @ 401,478: 19x12|#122 @ 824,565: 21x14|#123 @ 582,555: 11x11|#124 @ 611,400: 12x21|#125 @ 699,603: 19x26|#126 @ 580,954: 22x16|#127 @ 168,611: 20x25|#128 @ 871,217: 11x29|#129 @ 133,49: 20x16|#130 @ 741,751: 15x22|#131 @ 511,843: 22x22|#132 @ 22,973: 22x11|#133 @ 11,478: 27x16|#134 @ 481,516: 21x29|#135 @ 55,203: 16x21|#136 @ 828,297: 11x26|#137 @ 458,329: 20x23|#138 @ 872,559: 17x25|#139 @ 442,749: 11x27|#140 @ 101,29: 13x17|#141 @ 403,579: 25x14|#142 @ 820,759: 27x27|#143 @ 41,183: 28x24|#144 @ 941,674: 26x14|#145 @ 82,783: 10x19|#146 @ 90,468: 17x25|#147 @ 860,950: 14x15|#148 @ 68,246: 23x22|#149 @ 501,689: 13x14|#150 @ 750,830: 19x27|#151 @ 290,509: 10x23|#152 @ 226,267: 23x14|#153 @ 851,914: 13x28|#154 @ 917,927: 27x10|#155 @ 592,553: 29x16|#156 @ 403,250: 4x5|#157 @ 798,624: 17x20|#158 @ 103,424: 19x19|#159 @ 842,141: 29x28|#160 @ 482,820: 13x29|#161 @ 288,480: 15x21|#162 @ 911,253: 10x13|#163 @ 851,610: 28x12|#164 @ 35,154: 27x26|#165 @ 42,404: 10x21|#166 @ 690,325: 28x28|#167 @ 978,853: 13x10|#168 @ 823,728: 18x11|#169 @ 423,940: 12x11|#170 @ 297,480: 12x10|#171 @ 759,805: 18x27|#172 @ 361,669: 24x28|#173 @ 849,203: 18x18|#174 @ 731,503: 25x21|#175 @ 549,462: 13x29|#176 @ 185,967: 21x10|#177 @ 13,177: 27x12|#178 @ 830,559: 26x17|#179 @ 835,119: 26x29|#180 @ 534,777: 25x14|#181 @ 1,619: 12x21|#182 @ 700,637: 25x15|#183 @ 872,497: 26x14|#184 @ 380,310: 13x14|#185 @ 227,467: 26x19|#186 @ 452,858: 11x11|#187 @ 779,229: 13x21|#188 @ 364,201: 16x17|#189 @ 599,295: 17x15|#190 @ 41,740: 21x18|#191 @ 940,467: 10x29|#192 @ 564,460: 27x23|#193 @ 955,484: 28x19|#194 @ 128,611: 22x10|#195 @ 825,669: 10x10|#196 @ 150,578: 17x12|#197 @ 218,763: 22x25|#198 @ 89,484: 26x12|#199 @ 427,506: 29x24|#200 @ 347,867: 15x13|#201 @ 853,273: 28x17|#202 @ 923,843: 20x13|#203 @ 145,741: 20x19|#204 @ 831,285: 20x21|#205 @ 383,340: 5x11|#206 @ 283,819: 24x14|#207 @ 380,282: 25x12|#208 @ 202,729: 18x11|#209 @ 183,540: 13x14|#210 @ 907,576: 14x13|#211 @ 773,87: 28x26|#212 @ 473,325: 16x18|#213 @ 723,815: 17x18|#214 @ 725,763: 25x16|#215 @ 599,215: 25x28|#216 @ 790,133: 19x22|#217 @ 708,927: 15x28|#218 @ 539,699: 27x24|#219 @ 892,24: 12x14|#220 @ 17,518: 13x19|#221 @ 639,687: 22x28|#222 @ 884,796: 15x12|#223 @ 126,130: 13x18|#224 @ 303,343: 22x23|#225 @ 101,555: 19x27|#226 @ 151,172: 18x26|#227 @ 692,194: 20x16|#228 @ 659,943: 27x28|#229 @ 388,149: 19x10|#230 @ 195,580: 16x11|#231 @ 396,571: 21x17|#232 @ 608,716: 5x11|#233 @ 447,581: 15x12|#234 @ 316,83: 10x25|#235 @ 123,583: 21x26|#236 @ 99,560: 12x19|#237 @ 670,370: 27x23|#238 @ 435,360: 24x10|#239 @ 851,350: 19x16|#240 @ 198,650: 27x27|#241 @ 201,16: 17x14|#242 @ 472,15: 15x18|#243 @ 284,639: 25x23|#244 @ 104,871: 22x3|#245 @ 557,196: 27x23|#246 @ 948,875: 10x19|#247 @ 137,565: 18x15|#248 @ 933,483: 23x28|#249 @ 216,716: 22x18|#250 @ 588,350: 21x28|#251 @ 94,233: 25x13|#252 @ 825,172: 17x16|#253 @ 369,281: 16x16|#254 @ 731,900: 19x13|#255 @ 18,142: 16x29|#256 @ 685,255: 29x22|#257 @ 828,49: 21x13|#258 @ 944,398: 12x19|#259 @ 363,228: 17x26|#260 @ 590,470: 19x17|#261 @ 530,112: 22x25|#262 @ 111,172: 27x23|#263 @ 811,709: 25x25|#264 @ 517,252: 26x26|#265 @ 771,87: 11x24|#266 @ 496,456: 12x18|#267 @ 865,161: 25x15|#268 @ 312,927: 17x16|#269 @ 273,950: 11x19|#270 @ 368,689: 25x11|#271 @ 328,956: 11x23|#272 @ 598,367: 23x18|#273 @ 314,83: 25x25|#274 @ 814,403: 15x13|#275 @ 455,421: 3x7|#276 @ 198,519: 14x22|#277 @ 239,166: 17x22|#278 @ 792,529: 29x23|#279 @ 336,192: 12x28|#280 @ 202,25: 26x16|#281 @ 474,516: 23x21|#282 @ 185,724: 23x10|#283 @ 541,199: 16x11|#284 @ 837,248: 25x17|#285 @ 528,34: 26x23|#286 @ 708,589: 21x16|#287 @ 893,409: 14x12|#288 @ 706,691: 12x15|#289 @ 557,764: 21x24|#290 @ 851,206: 12x6|#291 @ 606,785: 11x15|#292 @ 790,209: 23x27|#293 @ 302,415: 13x21|#294 @ 226,836: 28x26|#295 @ 758,668: 24x21|#296 @ 239,353: 15x11|#297 @ 274,260: 11x24|#298 @ 798,713: 27x20|#299 @ 72,258: 19x10|#300 @ 215,35: 20x20|#301 @ 335,766: 27x23|#302 @ 722,66: 12x27|#303 @ 188,946: 12x15|#304 @ 942,184: 22x21|#305 @ 244,404: 15x22|#306 @ 126,716: 27x18|#307 @ 643,663: 27x24|#308 @ 256,830: 28x22|#309 @ 639,778: 24x24|#310 @ 241,4: 21x10|#311 @ 332,266: 20x22|#312 @ 64,340: 29x10|#313 @ 738,853: 22x13|#314 @ 473,585: 12x26|#315 @ 956,863: 12x15|#316 @ 806,169: 25x22|#317 @ 466,340: 26x26|#318 @ 420,130: 16x4|#319 @ 353,804: 29x26|#320 @ 627,882: 29x17|#321 @ 393,170: 24x23|#322 @ 116,314: 19x20|#323 @ 871,841: 10x16|#324 @ 487,327: 17x17|#325 @ 502,101: 18x25|#326 @ 580,851: 15x18|#327 @ 668,709: 18x20|#328 @ 666,163: 23x24|#329 @ 17,51: 11x22|#330 @ 114,227: 11x16|#331 @ 906,247: 20x11|#332 @ 748,39: 19x23|#333 @ 929,236: 27x17|#334 @ 232,781: 21x20|#335 @ 94,734: 10x14|#336 @ 445,927: 15x20|#337 @ 54,256: 19x22|#338 @ 719,911: 13x21|#339 @ 688,762: 21x26|#340 @ 819,127: 27x28|#341 @ 143,53: 17x25|#342 @ 27,177: 22x25|#343 @ 121,583: 18x22|#344 @ 402,817: 11x10|#345 @ 6,18: 15x27|#346 @ 316,467: 20x23|#347 @ 532,863: 25x16|#348 @ 523,203: 23x29|#349 @ 98,882: 23x22|#350 @ 506,360: 25x29|#351 @ 378,538: 21x22|#352 @ 728,371: 11x14|#353 @ 359,663: 4x18|#354 @ 24,21: 25x29|#355 @ 872,610: 25x28|#356 @ 362,389: 21x25|#357 @ 711,179: 18x28|#358 @ 32,924: 19x20|#359 @ 45,785: 26x28|#360 @ 667,259: 26x12|#361 @ 79,147: 18x25|#362 @ 103,738: 14x17|#363 @ 320,683: 23x13|#364 @ 504,26: 24x13|#365 @ 490,816: 12x23|#366 @ 722,602: 11x24|#367 @ 25,663: 17x20|#368 @ 295,115: 17x23|#369 @ 729,238: 10x25|#370 @ 288,500: 18x15|#371 @ 653,973: 29x10|#372 @ 475,899: 18x13|#373 @ 27,848: 25x23|#374 @ 962,848: 20x24|#375 @ 834,846: 11x16|#376 @ 470,524: 17x14|#377 @ 296,525: 25x12|#378 @ 27,708: 18x27|#379 @ 156,69: 6x21|#380 @ 67,650: 13x25|#381 @ 462,602: 7x7|#382 @ 222,720: 11x28|#383 @ 622,738: 27x13|#384 @ 278,449: 13x26|#385 @ 565,956: 15x15|#386 @ 434,589: 18x12|#387 @ 984,773: 11x17|#388 @ 169,150: 12x25|#389 @ 641,505: 29x15|#390 @ 18,973: 11x25|#391 @ 441,91: 28x20|#392 @ 230,677: 20x27|#393 @ 682,266: 10x21|#394 @ 696,685: 13x10|#395 @ 962,219: 23x17|#396 @ 500,876: 21x11|#397 @ 13,831: 10x16|#398 @ 69,771: 27x16|#399 @ 661,717: 19x18|#400 @ 125,794: 26x13|#401 @ 829,842: 26x16|#402 @ 865,885: 22x22|#403 @ 943,696: 21x21|#404 @ 579,131: 11x17|#405 @ 933,120: 27x17|#406 @ 18,551: 15x16|#407 @ 216,644: 11x13|#408 @ 79,502: 24x17|#409 @ 892,612: 21x25|#410 @ 565,346: 18x21|#411 @ 153,122: 16x28|#412 @ 436,52: 21x15|#413 @ 190,513: 20x17|#414 @ 871,159: 26x28|#415 @ 752,338: 29x16|#416 @ 599,706: 23x24|#417 @ 739,165: 3x9|#418 @ 78,187: 22x20|#419 @ 24,242: 18x21|#420 @ 109,420: 24x26|#421 @ 340,390: 17x10|#422 @ 561,241: 27x26|#423 @ 48,216: 23x11|#424 @ 971,63: 25x18|#425 @ 227,873: 26x24|#426 @ 874,477: 12x23|#427 @ 95,187: 19x22|#428 @ 652,471: 13x22|#429 @ 333,484: 25x24|#430 @ 332,450: 24x16|#431 @ 134,940: 21x21|#432 @ 632,621: 16x12|#433 @ 396,626: 29x21|#434 @ 627,562: 22x17|#435 @ 368,91: 22x26|#436 @ 631,410: 22x11|#437 @ 667,572: 20x19|#438 @ 494,803: 12x29|#439 @ 398,294: 26x28|#440 @ 236,466: 23x23|#441 @ 91,290: 13x25|#442 @ 940,830: 14x16|#443 @ 747,854: 24x7|#444 @ 34,155: 15x23|#445 @ 874,140: 20x24|#446 @ 481,307: 15x24|#447 @ 557,43: 15x13|#448 @ 314,963: 18x13|#449 @ 761,854: 16x26|#450 @ 681,562: 14x18|#451 @ 766,115: 17x10|#452 @ 212,575: 23x12|#453 @ 935,35: 17x13|#454 @ 797,28: 22x28|#455 @ 102,204: 26x21|#456 @ 424,910: 22x27|#457 @ 470,557: 20x25|#458 @ 973,145: 23x26|#459 @ 542,17: 11x24|#460 @ 636,786: 13x17|#461 @ 873,152: 24x24|#462 @ 839,51: 24x26|#463 @ 731,771: 27x17|#464 @ 9,533: 21x18|#465 @ 450,155: 17x21|#466 @ 928,928: 17x28|#467 @ 113,369: 16x17|#468 @ 807,141: 20x11|#469 @ 425,161: 26x26|#470 @ 155,709: 24x11|#471 @ 490,618: 10x15|#472 @ 514,492: 26x22|#473 @ 855,240: 17x20|#474 @ 868,265: 17x28|#475 @ 31,887: 15x29|#476 @ 620,822: 28x14|#477 @ 619,721: 29x27|#478 @ 85,29: 20x23|#479 @ 489,788: 15x27|#480 @ 952,625: 22x22|#481 @ 736,349: 29x24|#482 @ 844,548: 27x14|#483 @ 175,289: 26x18|#484 @ 95,470: 22x13|#485 @ 20,134: 14x14|#486 @ 42,915: 20x19|#487 @ 169,304: 22x21|#488 @ 35,393: 27x18|#489 @ 436,334: 26x17|#490 @ 506,4: 26x21|#491 @ 541,95: 17x12|#492 @ 649,516: 25x21|#493 @ 252,427: 9x6|#494 @ 478,555: 16x13|#495 @ 142,267: 12x11|#496 @ 590,440: 25x17|#497 @ 212,547: 19x14|#498 @ 85,402: 27x18|#499 @ 94,361: 21x11|#500 @ 963,219: 18x18|#501 @ 864,377: 16x28|#502 @ 8,297: 24x10|#503 @ 967,61: 10x24|#504 @ 654,581: 11x20|#505 @ 562,148: 28x19|#506 @ 172,605: 11x20|#507 @ 34,672: 11x27|#508 @ 553,579: 19x19|#509 @ 649,751: 22x29|#510 @ 174,4: 24x27|#511 @ 20,164: 21x21|#512 @ 975,920: 22x14|#513 @ 799,519: 15x20|#514 @ 209,91: 28x19|#515 @ 132,153: 25x13|#516 @ 953,192: 21x14|#517 @ 328,813: 28x20|#518 @ 772,693: 20x14|#519 @ 305,925: 16x13|#520 @ 354,247: 11x23|#521 @ 772,118: 18x19|#522 @ 835,665: 10x29|#523 @ 375,111: 18x10|#524 @ 550,911: 16x11|#525 @ 213,792: 28x20|#526 @ 896,452: 13x20|#527 @ 966,651: 14x18|#528 @ 857,674: 28x24|#529 @ 697,83: 15x11|#530 @ 2,619: 24x22|#531 @ 134,157: 11x4|#532 @ 483,212: 19x29|#533 @ 600,296: 10x24|#534 @ 173,265: 20x12|#535 @ 561,45: 25x25|#536 @ 755,808: 19x12|#537 @ 303,417: 28x15|#538 @ 368,505: 19x24|#539 @ 48,180: 12x29|#540 @ 601,961: 20x17|#541 @ 716,522: 14x17|#542 @ 729,754: 23x12|#543 @ 970,630: 22x27|#544 @ 924,113: 10x23|#545 @ 670,168: 15x23|#546 @ 415,555: 15x17|#547 @ 261,949: 29x25|#548 @ 708,498: 11x23|#549 @ 244,472: 20x17|#550 @ 393,291: 21x28|#551 @ 892,759: 13x29|#552 @ 48,13: 13x18|#553 @ 354,658: 27x28|#554 @ 827,156: 22x18|#555 @ 522,93: 27x28|#556 @ 502,684: 11x20|#557 @ 20,165: 19x22|#558 @ 924,152: 11x24|#559 @ 68,364: 29x14|#560 @ 147,67: 21x26|#561 @ 669,243: 17x21|#562 @ 838,761: 20x26|#563 @ 592,638: 26x12|#564 @ 328,937: 12x22|#565 @ 769,309: 27x21|#566 @ 784,37: 21x24|#567 @ 789,514: 11x13|#568 @ 804,605: 18x24|#569 @ 599,456: 15x17|#570 @ 428,65: 14x19|#571 @ 86,574: 18x26|#572 @ 170,198: 29x11|#573 @ 981,327: 11x27|#574 @ 250,168: 24x18|#575 @ 272,639: 19x10|#576 @ 667,145: 29x15|#577 @ 674,718: 28x29|#578 @ 133,791: 23x17|#579 @ 538,46: 24x15|#580 @ 605,714: 20x11|#581 @ 249,626: 23x24|#582 @ 660,141: 22x15|#583 @ 837,675: 3x14|#584 @ 273,318: 22x12|#585 @ 503,883: 11x13|#586 @ 526,336: 13x28|#587 @ 332,0: 20x28|#588 @ 766,678: 16x22|#589 @ 658,139: 12x18|#590 @ 877,900: 25x22|#591 @ 336,251: 25x22|#592 @ 718,149: 28x27|#593 @ 745,843: 29x23|#594 @ 140,941: 19x17|#595 @ 585,639: 14x21|#596 @ 876,141: 19x28|#597 @ 347,873: 24x21|#598 @ 902,706: 18x12|#599 @ 510,535: 17x23|#600 @ 769,666: 27x18|#601 @ 111,449: 16x16|#602 @ 949,820: 23x28|#603 @ 488,535: 13x29|#604 @ 480,670: 13x26|#605 @ 129,390: 14x26|#606 @ 824,559: 15x5|#607 @ 432,855: 26x27|#608 @ 602,462: 6x5|#609 @ 877,314: 27x21|#610 @ 719,398: 14x15|#611 @ 131,423: 15x19|#612 @ 436,616: 27x19|#613 @ 474,948: 25x10|#614 @ 355,908: 13x15|#615 @ 530,372: 20x10|#616 @ 777,51: 22x20|#617 @ 975,755: 15x26|#618 @ 8,156: 28x21|#619 @ 93,598: 20x26|#620 @ 526,369: 14x13|#621 @ 300,828: 18x15|#622 @ 938,109: 15x28|#623 @ 598,528: 22x29|#624 @ 924,155: 14x25|#625 @ 611,828: 12x21|#626 @ 749,850: 26x19|#627 @ 837,55: 11x26|#628 @ 326,633: 24x12|#629 @ 440,103: 17x24|#630 @ 379,817: 11x26|#631 @ 179,207: 10x12|#632 @ 493,732: 13x24|#633 @ 595,188: 27x21|#634 @ 518,182: 22x20|#635 @ 85,165: 29x14|#636 @ 878,615: 26x24|#637 @ 374,174: 12x16|#638 @ 858,317: 25x12|#639 @ 222,697: 11x15|#640 @ 228,930: 23x28|#641 @ 808,938: 29x12|#642 @ 274,322: 15x10|#643 @ 222,473: 10x16|#644 @ 114,787: 28x25|#645 @ 543,195: 22x20|#646 @ 555,134: 15x28|#647 @ 32,401: 16x10|#648 @ 406,418: 11x22|#649 @ 147,579: 20x13|#650 @ 903,102: 17x11|#651 @ 213,156: 21x20|#652 @ 346,876: 24x19|#653 @ 345,236: 18x19|#654 @ 571,893: 11x13|#655 @ 406,467: 10x19|#656 @ 946,72: 27x18|#657 @ 74,674: 11x28|#658 @ 749,823: 16x27|#659 @ 26,24: 29x12|#660 @ 706,470: 28x18|#661 @ 887,573: 25x29|#662 @ 311,166: 16x10|#663 @ 587,244: 28x17|#664 @ 639,624: 5x4|#665 @ 77,592: 23x11|#666 @ 633,83: 27x27|#667 @ 251,827: 20x27|#668 @ 32,233: 12x18|#669 @ 725,894: 18x23|#670 @ 653,766: 19x12|#671 @ 613,395: 29x29|#672 @ 719,377: 11x26|#673 @ 794,790: 13x13|#674 @ 557,212: 23x28|#675 @ 616,846: 25x20|#676 @ 880,11: 18x14|#677 @ 813,23: 27x29|#678 @ 458,727: 23x21|#679 @ 550,743: 26x20|#680 @ 467,448: 12x23|#681 @ 544,131: 10x27|#682 @ 787,108: 16x16|#683 @ 736,65: 21x17|#684 @ 381,821: 3x11|#685 @ 272,181: 11x16|#686 @ 895,401: 10x14|#687 @ 271,578: 26x22|#688 @ 205,249: 16x26|#689 @ 230,140: 21x27|#690 @ 378,368: 23x18|#691 @ 743,904: 21x28|#692 @ 721,493: 18x11|#693 @ 305,335: 19x18|#694 @ 776,777: 27x11|#695 @ 506,18: 21x13|#696 @ 475,757: 20x26|#697 @ 170,952: 26x25|#698 @ 14,225: 11x19|#699 @ 934,589: 15x29|#700 @ 497,500: 10x23|#701 @ 506,688: 15x20|#702 @ 125,966: 17x26|#703 @ 875,498: 21x22|#704 @ 880,606: 18x12|#705 @ 898,385: 16x28|#706 @ 276,863: 8x5|#707 @ 924,617: 16x20|#708 @ 509,1: 28x18|#709 @ 869,452: 27x16|#710 @ 414,644: 21x10|#711 @ 347,234: 10x23|#712 @ 880,610: 19x18|#713 @ 949,307: 26x15|#714 @ 271,572: 14x17|#715 @ 787,500: 10x27|#716 @ 611,958: 23x28|#717 @ 346,566: 29x12|#718 @ 808,398: 16x23|#719 @ 642,369: 24x21|#720 @ 24,566: 15x18|#721 @ 472,888: 25x20|#722 @ 470,434: 17x11|#723 @ 822,651: 23x11|#724 @ 896,445: 14x16|#725 @ 927,712: 17x13|#726 @ 54,364: 27x23|#727 @ 971,346: 12x18|#728 @ 169,682: 15x14|#729 @ 576,56: 12x15|#730 @ 311,425: 11x25|#731 @ 844,553: 25x24|#732 @ 125,403: 13x29|#733 @ 926,600: 15x21|#734 @ 881,296: 12x26|#735 @ 520,507: 28x22|#736 @ 813,420: 28x22|#737 @ 294,477: 20x27|#738 @ 638,584: 23x11|#739 @ 855,322: 25x19|#740 @ 321,552: 17x25|#741 @ 431,368: 14x19|#742 @ 569,431: 23x17|#743 @ 829,908: 25x23|#744 @ 823,256: 14x16|#745 @ 233,841: 19x16|#746 @ 175,975: 14x18|#747 @ 325,184: 26x24|#748 @ 876,144: 4x14|#749 @ 739,162: 26x11|#750 @ 10,128: 21x28|#751 @ 506,417: 28x17|#752 @ 728,409: 27x26|#753 @ 635,548: 28x18|#754 @ 208,250: 14x29|#755 @ 546,783: 18x21|#756 @ 965,611: 27x15|#757 @ 104,334: 12x13|#758 @ 697,469: 26x12|#759 @ 508,722: 23x21|#760 @ 410,313: 22x16|#761 @ 865,833: 13x26|#762 @ 777,901: 28x25|#763 @ 912,938: 28x15|#764 @ 865,898: 21x12|#765 @ 3,121: 11x10|#766 @ 855,555: 23x21|#767 @ 880,806: 10x28|#768 @ 305,499: 18x25|#769 @ 360,920: 16x10|#770 @ 817,347: 14x11|#771 @ 626,907: 22x29|#772 @ 959,793: 22x25|#773 @ 650,479: 29x21|#774 @ 20,262: 19x17|#775 @ 982,316: 10x26|#776 @ 334,764: 25x16|#777 @ 448,967: 13x15|#778 @ 357,366: 29x14|#779 @ 528,561: 17x11|#780 @ 903,773: 15x11|#781 @ 790,453: 25x10|#782 @ 754,353: 23x15|#783 @ 476,800: 19x22|#784 @ 911,904: 16x17|#785 @ 303,916: 10x19|#786 @ 508,418: 16x13|#787 @ 279,568: 10x12|#788 @ 553,473: 11x17|#789 @ 779,327: 21x25|#790 @ 725,522: 19x18|#791 @ 387,557: 29x10|#792 @ 697,600: 21x11|#793 @ 507,690: 11x10|#794 @ 380,288: 26x26|#795 @ 804,448: 23x10|#796 @ 526,625: 28x14|#797 @ 562,502: 25x14|#798 @ 341,817: 16x28|#799 @ 908,838: 16x14|#800 @ 310,824: 26x18|#801 @ 826,333: 15x24|#802 @ 177,12: 27x17|#803 @ 443,156: 11x16|#804 @ 445,904: 23x29|#805 @ 541,412: 21x20|#806 @ 553,492: 18x23|#807 @ 877,616: 15x26|#808 @ 514,143: 26x21|#809 @ 964,687: 15x10|#810 @ 2,738: 29x15|#811 @ 850,772: 10x26|#812 @ 816,524: 22x20|#813 @ 573,336: 25x13|#814 @ 357,69: 17x29|#815 @ 361,680: 26x25|#816 @ 822,557: 20x12|#817 @ 537,627: 14x20|#818 @ 522,128: 25x11|#819 @ 456,959: 24x14|#820 @ 914,283: 12x21|#821 @ 74,261: 20x14|#822 @ 405,549: 28x17|#823 @ 592,205: 27x13|#824 @ 452,539: 20x25|#825 @ 539,415: 25x10|#826 @ 170,161: 19x11|#827 @ 337,509: 29x10|#828 @ 821,897: 24x17|#829 @ 818,556: 16x20|#830 @ 781,202: 12x16|#831 @ 366,52: 26x18|#832 @ 11,793: 21x13|#833 @ 717,395: 19x28|#834 @ 95,529: 10x20|#835 @ 11,929: 25x29|#836 @ 258,513: 11x24|#837 @ 599,838: 18x27|#838 @ 956,308: 20x23|#839 @ 622,907: 21x26|#840 @ 746,842: 28x14|#841 @ 351,389: 25x14|#842 @ 496,794: 21x28|#843 @ 474,784: 15x29|#844 @ 834,675: 25x17|#845 @ 138,587: 17x12|#846 @ 886,610: 14x3|#847 @ 297,233: 16x14|#848 @ 117,753: 20x16|#849 @ 588,133: 12x13|#850 @ 589,334: 13x22|#851 @ 701,716: 27x29|#852 @ 306,815: 28x27|#853 @ 952,620: 28x13|#854 @ 629,672: 21x28|#855 @ 826,641: 25x28|#856 @ 229,194: 13x21|#857 @ 291,785: 25x25|#858 @ 300,360: 27x26|#859 @ 500,452: 23x29|#860 @ 964,945: 21x15|#861 @ 829,504: 13x26|#862 @ 916,80: 27x22|#863 @ 738,56: 13x25|#864 @ 637,737: 28x19|#865 @ 69,586: 28x26|#866 @ 589,28: 27x18|#867 @ 21,742: 27x20|#868 @ 331,557: 21x22|#869 @ 21,170: 11x22|#870 @ 837,110: 13x10|#871 @ 326,733: 27x28|#872 @ 874,767: 18x16|#873 @ 14,33: 17x19|#874 @ 354,886: 29x27|#875 @ 801,510: 22x24|#876 @ 106,560: 9x14|#877 @ 179,212: 23x16|#878 @ 422,608: 16x17|#879 @ 289,418: 29x17|#880 @ 168,666: 14x27|#881 @ 532,20: 25x28|#882 @ 641,89: 20x26|#883 @ 351,442: 24x13|#884 @ 432,565: 25x18|#885 @ 778,531: 29x28|#886 @ 764,316: 20x26|#887 @ 649,760: 10x14|#888 @ 778,912: 24x14|#889 @ 438,154: 23x12|#890 @ 25,868: 16x15|#891 @ 542,718: 6x4|#892 @ 326,223: 24x29|#893 @ 489,653: 10x24|#894 @ 114,239: 23x25|#895 @ 926,513: 27x12|#896 @ 441,577: 11x17|#897 @ 828,540: 27x27|#898 @ 597,336: 10x26|#899 @ 791,203: 11x26|#900 @ 951,225: 17x12|#901 @ 525,419: 13x22|#902 @ 844,615: 21x25|#903 @ 314,754: 28x17|#904 @ 906,294: 13x26|#905 @ 456,923: 28x19|#906 @ 944,137: 22x25|#907 @ 14,846: 20x16|#908 @ 283,59: 20x29|#909 @ 777,349: 26x23|#910 @ 169,694: 10x23|#911 @ 587,859: 28x14|#912 @ 490,610: 23x26|#913 @ 773,789: 11x21|#914 @ 109,368: 27x29|#915 @ 627,109: 28x10|#916 @ 233,154: 28x13|#917 @ 94,294: 13x12|#918 @ 830,554: 11x25|#919 @ 16,304: 10x17|#920 @ 443,105: 23x16|#921 @ 535,118: 17x24|#922 @ 413,518: 23x21|#923 @ 6,478: 12x11|#924 @ 343,35: 24x27|#925 @ 366,389: 19x17|#926 @ 832,319: 11x27|#927 @ 272,779: 29x12|#928 @ 656,777: 13x27|#929 @ 924,72: 18x23|#930 @ 155,48: 17x11|#931 @ 51,104: 28x14|#932 @ 870,635: 23x19|#933 @ 728,266: 19x10|#934 @ 452,876: 25x25|#935 @ 5,743: 15x23|#936 @ 576,339: 11x27|#937 @ 775,880: 21x25|#938 @ 154,947: 12x14|#939 @ 892,817: 20x11|#940 @ 826,333: 15x20|#941 @ 682,50: 22x19|#942 @ 794,532: 24x8|#943 @ 128,44: 16x10|#944 @ 894,400: 18x10|#945 @ 847,660: 18x21|#946 @ 145,611: 27x28|#947 @ 519,235: 27x26|#948 @ 795,913: 19x26|#949 @ 957,427: 23x20|#950 @ 984,904: 14x25|#951 @ 474,898: 12x19|#952 @ 436,415: 15x29|#953 @ 756,212: 29x23|#954 @ 775,886: 29x27|#955 @ 415,837: 14x24|#956 @ 668,462: 14x14|#957 @ 523,128: 13x24|#958 @ 75,486: 16x23|#959 @ 455,557: 23x29|#960 @ 344,796: 14x25|#961 @ 805,416: 16x22|#962 @ 828,633: 22x10|#963 @ 34,862: 15x16|#964 @ 8,196: 27x15|#965 @ 436,207: 14x24|#966 @ 365,210: 23x20|#967 @ 5,124: 5x3|#968 @ 326,469: 6x11|#969 @ 631,965: 14x23|#970 @ 132,750: 24x10|#971 @ 445,399: 24x29|#972 @ 934,875: 26x27|#973 @ 222,83: 20x18|#974 @ 972,163: 11x11|#975 @ 88,464: 12x20|#976 @ 43,89: 18x17|#977 @ 594,182: 18x28|#978 @ 456,593: 20x21|#979 @ 936,486: 26x23|#980 @ 80,306: 20x29|#981 @ 97,370: 26x23|#982 @ 755,503: 14x28|#983 @ 855,776: 28x18|#984 @ 510,151: 23x23|#985 @ 539,461: 25x10|#986 @ 470,36: 17x11|#987 @ 127,586: 14x28|#988 @ 596,955: 16x29|#989 @ 593,803: 16x28|#990 @ 453,444: 26x15|#991 @ 96,273: 14x24|#992 @ 901,825: 23x24|#993 @ 743,74: 22x13|#994 @ 800,714: 13x23|#995 @ 537,151: 12x13|#996 @ 861,99: 28x23|#997 @ 23,125: 18x17|#998 @ 450,47: 28x18|#999 @ 93,488: 12x21|#1000 @ 954,423: 20x19|#1001 @ 271,882: 26x20|#1002 @ 957,726: 13x23|#1003 @ 223,252: 12x23|#1004 @ 36,732: 14x13|#1005 @ 621,91: 17x10|#1006 @ 496,512: 18x18|#1007 @ 146,474: 10x29|#1008 @ 623,222: 12x17|#1009 @ 93,338: 29x21|#1010 @ 869,831: 23x27|#1011 @ 13,596: 22x24|#1012 @ 409,422: 14x20|#1013 @ 331,490: 18x13|#1014 @ 307,342: 26x14|#1015 @ 887,975: 11x7|#1016 @ 732,155: 16x26|#1017 @ 327,206: 26x29|#1018 @ 670,233: 27x23|#1019 @ 333,868: 17x11|#1020 @ 678,46: 28x15|#1021 @ 93,123: 10x27|#1022 @ 673,577: 15x19|#1023 @ 416,128: 28x10|#1024 @ 751,527: 14x27|#1025 @ 435,591: 20x11|#1026 @ 838,675: 23x18|#1027 @ 877,785: 20x28|#1028 @ 525,800: 23x21|#1029 @ 710,886: 17x29|#1030 @ 302,172: 18x28|#1031 @ 417,198: 19x23|#1032 @ 690,322: 19x10|#1033 @ 376,140: 21x26|#1034 @ 298,113: 28x22|#1035 @ 130,602: 19x11|#1036 @ 93,55: 18x17|#1037 @ 394,645: 21x29|#1038 @ 574,737: 12x14|#1039 @ 863,417: 15x25|#1040 @ 217,258: 18x28|#1041 @ 549,716: 19x21|#1042 @ 905,710: 10x4|#1043 @ 723,390: 11x21|#1044 @ 908,290: 10x15|#1045 @ 390,321: 26x21|#1046 @ 201,260: 11x18|#1047 @ 440,906: 26x13|#1048 @ 822,852: 21x14|#1049 @ 217,498: 23x26|#1050 @ 555,900: 24x15|#1051 @ 337,647: 25x23|#1052 @ 231,514: 12x22|#1053 @ 467,885: 13x24|#1054 @ 294,566: 12x22|#1055 @ 45,74: 22x26|#1056 @ 656,153: 20x15|#1057 @ 61,61: 29x20|#1058 @ 908,114: 17x19|#1059 @ 25,519: 18x17|#1060 @ 121,135: 28x22|#1061 @ 81,259: 27x18|#1062 @ 963,409: 24x10|#1063 @ 942,790: 21x17|#1064 @ 452,332: 22x26|#1065 @ 194,694: 20x24|#1066 @ 154,64: 15x29|#1067 @ 212,526: 15x27|#1068 @ 396,324: 4x14|#1069 @ 9,242: 23x19|#1070 @ 441,773: 22x14|#1071 @ 377,336: 15x24|#1072 @ 945,209: 20x16|#1073 @ 447,539: 11x27|#1074 @ 694,388: 22x19|#1075 @ 630,681: 13x10|#1076 @ 720,351: 12x19|#1077 @ 932,932: 8x19|#1078 @ 651,969: 24x24|#1079 @ 453,266: 19x22|#1080 @ 688,612: 24x21|#1081 @ 844,33: 11x21|#1082 @ 102,440: 29x21|#1083 @ 145,740: 17x18|#1084 @ 266,931: 14x13|#1085 @ 783,786: 21x15|#1086 @ 805,614: 12x19|#1087 @ 831,772: 14x24|#1088 @ 958,55: 20x27|#1089 @ 722,76: 19x18|#1090 @ 409,541: 14x23|#1091 @ 376,903: 21x26|#1092 @ 699,508: 25x18|#1093 @ 518,334: 24x16|#1094 @ 872,663: 13x21|#1095 @ 778,946: 12x14|#1096 @ 916,554: 27x19|#1097 @ 418,200: 12x23|#1098 @ 929,24: 20x16|#1099 @ 171,579: 28x11|#1100 @ 382,530: 24x27|#1101 @ 510,141: 14x12|#1102 @ 239,6: 21x28|#1103 @ 479,297: 21x20|#1104 @ 553,814: 11x14|#1105 @ 146,81: 11x10|#1106 @ 625,890: 25x14|#1107 @ 877,65: 20x28|#1108 @ 842,852: 10x25|#1109 @ 359,636: 23x19|#1110 @ 645,387: 20x10|#1111 @ 326,14: 20x14|#1112 @ 828,511: 25x19|#1113 @ 399,516: 24x17|#1114 @ 604,715: 23x16|#1115 @ 772,936: 23x21|#1116 @ 258,346: 17x29|#1117 @ 885,973: 21x18|#1118 @ 114,561: 29x15|#1119 @ 712,260: 23x11|#1120 @ 670,935: 19x20|#1121 @ 158,936: 14x27|#1122 @ 867,617: 29x26|#1123 @ 235,270: 13x9|#1124 @ 794,609: 29x20|#1125 @ 608,207: 29x15|#1126 @ 788,558: 25x16|#1127 @ 782,569: 28x29|#1128 @ 264,381: 28x21|#1129 @ 301,241: 14x10|#1130 @ 25,515: 19x27|#1131 @ 761,779: 24x15|#1132 @ 238,406: 11x15|#1133 @ 842,141: 14x18|#1134 @ 879,577: 16x23|#1135 @ 418,315: 22x17|#1136 @ 113,589: 19x10|#1137 @ 658,584: 26x10|#1138 @ 457,907: 14x17|#1139 @ 717,899: 26x18|#1140 @ 556,953: 20x15|#1141 @ 439,912: 11x25|#1142 @ 785,695: 26x25|#1143 @ 886,143: 28x29|#1144 @ 139,169: 13x12|#1145 @ 273,260: 20x13|#1146 @ 595,319: 20x23|#1147 @ 485,25: 27x11|#1148 @ 551,929: 13x12|#1149 @ 88,103: 25x21|#1150 @ 84,246: 11x18|#1151 @ 532,1: 28x10|#1152 @ 744,204: 23x22|#1153 @ 506,471: 19x18|#1154 @ 235,800: 20x22|#1155 @ 557,931: 16x17|#1156 @ 490,209: 18x10|#1157 @ 497,12: 25x12|#1158 @ 785,917: 16x19|#1159 @ 725,62: 16x22|#1160 @ 987,723: 11x12|#1161 @ 102,804: 17x23|#1162 @ 624,791: 27x20|#1163 @ 928,879: 10x12|#1164 @ 215,864: 28x13|#1165 @ 306,544: 18x11|#1166 @ 874,160: 16x24|#1167 @ 954,41: 13x22|#1168 @ 306,282: 22x22|#1169 @ 50,846: 26x15|#1170 @ 415,664: 17x26|#1171 @ 881,607: 27x13|#1172 @ 786,249: 13x16|#1173 @ 423,615: 18x18|#1174 @ 61,733: 25x10|#1175 @ 791,624: 23x26|#1176 @ 597,954: 25x13|#1177 @ 490,469: 16x27|#1178 @ 945,43: 10x23|#1179 @ 933,390: 20x20|#1180 @ 469,431: 15x19|#1181 @ 4,241: 21x15|#1182 @ 654,462: 10x14|#1183 @ 55,240: 15x28|#1184 @ 921,914: 11x21|#1185 @ 412,938: 21x13|#1186 @ 571,928: 15x28|#1187 @ 601,825: 16x15|#1188 @ 213,258: 20x11|#1189 @ 790,607: 12x18|#1190 @ 489,335: 28x13|#1191 @ 118,305: 27x13|#1192 @ 791,198: 10x22|#1193 @ 953,643: 22x29|#1194 @ 49,228: 25x21|#1195 @ 913,552: 21x11|#1196 @ 172,700: 14x11|#1197 @ 525,513: 14x11|#1198 @ 208,951: 22x14|#1199 @ 568,140: 21x21|#1200 @ 94,536: 22x13|#1201 @ 525,132: 28x15|#1202 @ 449,621: 29x25|#1203 @ 924,487: 26x25|#1204 @ 430,84: 14x20|#1205 @ 26,576: 22x28|#1206 @ 253,626: 23x16|#1207 @ 546,4: 23x25|#1208 @ 142,598: 26x14|#1209 @ 305,952: 29x25|#1210 @ 990,726: 3x4|#1211 @ 917,516: 22x16|#1212 @ 630,552: 19x10|#1213 @ 45,670: 20x15|#1214 @ 886,143: 17x17|#1215 @ 299,664: 22x28|#1216 @ 46,10: 15x24|#1217 @ 18,720: 25x23|#1218 @ 716,564: 18x17|#1219 @ 949,735: 15x12|#1220 @ 497,295: 17x18|#1221 @ 431,181: 14x27|#1222 @ 469,743: 25x20|#1223 @ 854,942: 13x15|#1224 @ 538,199: 23x20|#1225 @ 349,179: 29x20|#1226 @ 476,811: 16x19|#1227 @ 967,443: 12x29|#1228 @ 644,939: 12x22|#1229 @ 137,130: 20x17|#1230 @ 234,207: 19x24|#1231 @ 32,405: 29x18|#1232 @ 51,803: 14x23|#1233 @ 724,253: 26x21|#1234 @ 0,175: 29x26|#1235 @ 465,46: 13x10|#1236 @ 324,756: 23x19|#1237 @ 275,930: 15x18|#1238 @ 107,35: 10x14|#1239 @ 50,664: 18x28|#1240 @ 305,273: 11x22|#1241 @ 113,804: 27x14|#1242 @ 508,309: 15x15|#1243 @ 33,250: 23x22|#1244 @ 814,600: 18x18|#1245 @ 710,380: 20x21|#1246 @ 689,574: 28x29|#1247 @ 0,244: 19x10|#1248 @ 130,240: 10x17|#1249 @ 401,245: 10x16|#1250 @ 191,968: 18x20|#1251 @ 243,844: 12x21|#1252 @ 875,791: 12x13|#1253 @ 286,842: 17x25|#1254 @ 148,582: 13x29|#1255 @ 277,641: 21x18|#1256 @ 874,463: 15x28|#1257 @ 10,268: 25x19|#1258 @ 887,451: 17x11|#1259 @ 484,473: 11x24|#1260 @ 553,738: 24x16|#1261 @ 11,588: 20x23|#1262 @ 631,548: 20x19|#1263 @ 866,306: 21x15|#1264 @ 202,576: 29x14|#1265 @ 808,898: 17x16|#1266 @ 542,578: 16x21|#1267 @ 586,355: 17x26|#1268 @ 453,559: 11x18|#1269 @ 261,363: 28x20|#1270 @ 847,757: 28x27|#1271 @ 912,99: 10x17|#1272 @ 608,409: 25x29|#1273 @ 691,212: 19x26|#1274 @ 713,894: 6x10|#1275 @ 629,75: 21x18|#1276 @ 660,784: 5x10|#1277 @ 97,734: 11x10|#1278 @ 827,793: 20x10|#1279 @ 893,920: 22x24|#1280 @ 577,899: 10x21|#1281 @ 700,259: 26x25|#1282 @ 898,431: 19x20|#1283 @ 70,978: 22x21|#1284 @ 875,379: 11x29|#1285 @ 106,936: 18x12|#1286 @ 762,889: 25x11|#1287 @ 139,294: 24x15|#1288 @ 441,93: 24x13|#1289 @ 647,569: 14x24|#1290 @ 129,582: 15x29|#1291 @ 955,949: 16x12|#1292 @ 268,529: 16x29|#1293 @ 494,42: 18x5|#1294 @ 136,979: 13x10|#1295 @ 706,77: 11x14|#1296 @ 899,321: 25x21|#1297 @ 715,362: 15x25|#1298 @ 387,195: 10x18|#1299 @ 219,933: 10x19|#1300 @ 218,93: 16x26|#1301 @ 862,546: 13x12|#1302 @ 665,756: 19x21|#1303 @ 530,1: 25x19|#1304 @ 709,195: 19x23|#1305 @ 805,345: 20x23|#1306 @ 227,690: 19x21|#1307 @ 603,797: 17x14|#1308 @ 867,112: 11x29|#1309 @ 410,644: 13x23|#1310 @ 454,780: 23x10|#1311 @ 513,371: 21x20|#1312 @ 435,770: 23x28|#1313 @ 754,376: 11x17|#1314 @ 571,41: 19x25|#1315 @ 957,775: 25x15|#1316 @ 523,482: 17x24|#1317 @ 34,49: 21x13|#1318 @ 812,889: 21x13|#1319 @ 103,28: 23x29|#1320 @ 878,231: 18x20|#1321 @ 366,677: 15x15|#1322 @ 687,267: 25x15|#1323 @ 477,483: 14x14|#1324 @ 900,138: 17x22|#1325 @ 155,481: 15x13|#1326 @ 919,87: 23x23|#1327 @ 130,717: 23x19|#1328 @ 58,575: 27x21|#1329 @ 561,331: 17x10|#1330 @ 67,47: 20x25|#1331 @ 662,92: 17x25|#1332 @ 748,382: 28x28|#1333 @ 787,665: 13x25|#1334 @ 889,153: 26x14|#1335 @ 519,562: 15x12|#1336 @ 511,483: 26x11|#1337 @ 543,792: 19x24|#1338 @ 657,491: 26x21|#1339 @ 83,561: 22x19|#1340 @ 488,37: 28x15|#1341 @ 448,880: 25x28|#1342 @ 310,917: 21x25|#1343 @ 989,320: 11x20|#1344 @ 899,933: 16x12|#1345 @ 499,150: 14x19|#1346 @ 386,509: 27x12|#1347 @ 525,537: 29x28|#1348 @ 340,744: 16x19|#1349 @ 633,565: 23x20|#1350 @ 379,509: 24x14|#1351 @ 182,257: 12x20|#1352 @ 641,966: 22x21|#1353 @ 451,102: 16x21|#1354 @ 319,838: 16x23|#1355 @ 685,638: 25x22|#1356 @ 859,613: 10x16|#1357 @ 839,539: 26x17|#1358 @ 248,424: 22x13|#1359 @ 82,976: 13x13|#1360 @ 453,418: 11x22|#1361 @ 737,54: 20x24|#1362 @ 574,326: 10x18|#1363 @ 341,838: 11x18|#1364 @ 527,368: 24x15|#1365 @ 505,411: 29x15|#1366 @ 524,738: 29x14|#1367 @ 511,106: 24x21|#1368 @ 358,853: 12x17|#1369 @ 112,727: 24x27|#1370 @ 290,446: 29x24|#1371 @ 401,190: 19x24|#1372 @ 329,30: 27x24|#1373 @ 81,896: 24x29|#1374 @ 186,956: 14x17|#1375 @ 116,944: 27x13|#1376 @ 672,186: 11x12|#1377 @ 585,329: 20x13|#1378 @ 839,855: 10x13|#1379 @ 437,273: 20x16|#1380 @ 650,528: 19x12|#1381 @ 163,61: 14x22|#1382 @ 790,566: 12x15|#1383 @ 755,744: 23x13|#1384 @ 347,868: 29x19|#1385 @ 667,95: 6x11|#1386 @ 190,457: 14x16|#1387 @ 967,389: 10x24|#1388 @ 598,633: 26x21|#1389 @ 498,461: 16x26|#1390 @ 156,73: 22x22|#1391 @ 676,454: 24x23|#1392 @ 244,673: 17x17|#1393 @ 601,405: 25x25|#1394 @ 781,130: 29x12|#1395 @ 604,196: 27x22|#1396 @ 545,117: 13x19|#1397 @ 447,737: 16x13|#1398 @ 199,216: 14x21|#1399 @ 668,144: 10x29|#1400 @ 171,710: 22x26|#1401 @ 203,0: 19x19|#1402 @ 870,826: 20x13|#1403 @ 908,260: 21x21|#1404 @ 598,1: 19x21|#1405 @ 362,515: 28x16|#1406 @ 760,806: 20x25|#1407 @ 749,350: 26x15|#1408 @ 8,147: 25x21|#1409 @ 16,529: 15x23"


// - - - - - Data import routines for day 3

extension NSTextCheckingResult {
    // Swift regular expression results are difficult to use.  This is a useful
    // helper for extracting the capture groups
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

func parseClaim(_ s:String) -> [Int] {
    // Parse a claim string and returns an array of ints: id, x, y, w, h
    let claimRE = try! NSRegularExpression(pattern: "#(\\d+) @ (\\d+)\\,(\\d+)\\: (\\d+)x(\\d+)")
    let range = NSRange(location: 0, length: s.count)
    let rex = claimRE.firstMatch(in: s, options: [], range: range)
    let groups = rex!.groups(testedString:s)
    assert(groups.count == 6)
    return [Int(groups[1])!, Int(groups[2])!, Int(groups[3])!,  Int(groups[4])!, Int(groups[5])! ]
}

// We keep 2 arrays.  In part 1 below we use the string format too for UI printing convenience.
let claimStrings = compactInput.split(separator: "|").filter( {$0.count>0} )
let claims = claimStrings.map { parseClaim(String($0)) }


// - - - - -
// Part 1: How much fabric is overlapping
//
// Track a grid with one occupancy value per cloth square so
// we can count simple and multiple overlaps.

// Figure out the bounds our grid will need
let c0 = claims[0]
let minX = claims.reduce(c0[1],       {mark,x in min(mark,x[1])})
let minY = claims.reduce(c0[2],       {mark,x in min(mark,x[2])})
let maxX = claims.reduce(c0[1]+c0[3], {mark,x in max(mark,x[1]+x[3])})
let maxY = claims.reduce(c0[2]+c0[4], {mark,x in max(mark,x[2]+x[4])})

print("X-range \(minX)-\(maxX), Y-range \(minY)-\(maxY)")

// Create an empty grid
var grid : [Int] = Array<Int>(repeating: 0, count: maxX * maxY)

// Because we use a single-dimensional array, add a helper to compute
// index values: index(x,y) -> index
func index( _ x : Int, _ y : Int ) -> Int { return (y*maxX) + x }

// For each square of each claim increment the occupancy values in the grid
for c in claims {
    let xstart = c[1], xstop = c[1]+c[3],  ystart=c[2], ystop=c[2]+c[4]
    for x in xstart..<xstop {
        for y in ystart..<ystop {
            grid[ index(x,y) ] += 1
        }
    }
}

// Compute stats for Part 1, counting squares with grid value 2 or more (==overlap)
// Just for fun, track count of single-occupancy and empty squares too.
var oneclaim = 0, more = 0, empty = 0
for x in grid { if x == 1 { oneclaim += 1 } else if x > 1 { more += 1 } else { empty += 1 }}
print("Found \(more) grid squares in at least 2 claims. (overlap)")
print("also, \(oneclaim) squares were used in just 1 claim and \(empty) were left empty.  Total check: \(more+oneclaim+empty) == \( (maxY-minY) * (maxX-minX) ).")



// - - - - -
// Part 2: Which one claim has zero overlap?
//
// For each claim look through its grid squares and print out the IDs of all/any
// claims with no overlap

for c in claims {
    let xstart = c[1], xstop = c[1]+c[3],  ystart=c[2], ystop=c[2]+c[4]
    var maxclaimcount = 0
    
    for x in xstart..<xstop {
        for y in ystart..<ystop {
            let g = grid[ index(x,y) ]
            if g > maxclaimcount { maxclaimcount = g }
        }
    }
    
    if maxclaimcount == 1 {
        print("Claim #\(c[0]) had no overlapping claims")
    }
}



