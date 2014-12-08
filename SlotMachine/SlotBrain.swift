//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Korey Stanley on 12/5/14.
//  Copyright (c) 2014 Black Sand. All rights reserved.
//

import Foundation
import UIKit

class SlotBrain {

    class func unpackSlotIntoSlotRows(slots: [[Slot]]) -> [[Slot]] {
        
        var slotRow1: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            for var index = 0;index < slotArray.count; index++ {
                let slot = slotArray[index]
                if index == 0 {
                    slotRow1.append(slot)
                }
                else if index == 1 {
                    slotRow2.append(slot)
                }
                else {
                    slotRow3.append(slot)
                }
            }
        }
        
        let slotRowArray: [[Slot]] = [slotRow1, slotRow2, slotRow3]
        return slotRowArray
    }
    
    
    class func computeWinnings(slots: [[Slot]]) -> Int {
        
        var slotsInRow: [[Slot]] = unpackSlotIntoSlotRows(slots)
        var winnings = 0
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRow {
            if checkFlush(slotRow) == true {
                println("flush")
                winnings += 1
                flushWinCount += 1
            }
            
            if checkThreeInARow(slotRow) {
                println("three in a row")
                winnings += 3
                straightWinCount += 1
            }
            
            if checkThreeOfAKind(slotRow) {
                println("Three of a Kind")
                winnings += 5
                threeOfAKindWinCount += 1
            }
            
        }
        
        if flushWinCount == 3 {
            println("Royal Flush!!")
            winnings += 15
        }
        
        if straightWinCount == 3 {
            println("Epic straight")
            winnings += 1000
        }
        
        if threeOfAKindWinCount == 3 {
            println("Threes all around")
            winnings += 50
        }
        
        return winnings
    }
    
    
    
    class func checkFlush(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        }
        else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeInARow (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        }
        else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2{
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeOfAKind (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        }
        else {
            return false
        }
    }
    
    
    
    
    
    
    
    
}