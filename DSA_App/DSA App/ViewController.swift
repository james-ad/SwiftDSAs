//
//  ViewController.swift
//  DSA App
//
//  Created by James Dunn on 2/25/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked() {
        let fooArray = [5,3,2,1,4]
        let bazArray = [10,4,2,7,5,8,3,1,9,6]
        let barArray = generateArrayOfInts(ofSize: 50)
        
        print(binarySearch(array: fooArray, for: 3) ?? "")
        print(binarySearch(array: bazArray, for: 3) ?? "")
        print(binarySearch(array: barArray, for: 3) ?? "")
    }


}

func generateArrayOfInts(ofSize sizeOfArray: Int) -> [Int] {
    if sizeOfArray < 1 { return [] }
    var intsArray: [Int] = []
    for _ in 0...sizeOfArray {
        intsArray.append(Int.random(in: 0...100))
    }
    
    return intsArray
}

/*
 Binary Search
 1. Good for searching ordered arrays since it is able to cut out half of the options with every iteration
 2. The time complexity of binary search is O(log n) because only 1 additional step is added to the time complexity every time the array doubles in size
 3. Can't be used on unordered array
 
 */
func binarySearch(array: [Int], for searchValue: Int) -> Int? {
    if array.count == 0 { return nil }
    let arrayCopy = array.sorted()
    var startingPoint: Int = 0
    var endPoint: Int = arrayCopy.count - 1
    var stepsCount: Int = 0
    // 1. if current midpoint is searchValue, return value
    // 2. if midpoint is greater than searchVal, endPoint = midpoint - 1
    // 3. if less than searchVal startingPoint = midpoint + 1
    // 4. Print number of steps the search took
    
    while startingPoint <= endPoint {
        stepsCount += 1
        let midPoint = Int(floor(Double(endPoint + startingPoint)) / 2)
        
        if arrayCopy[midPoint] == searchValue {
            print("The number \(searchValue) has been found")
            print("This binary search took \(stepsCount == 1 ? "\(stepsCount) step" : "\(stepsCount) steps")")
            return searchValue
        } else if arrayCopy[midPoint] > searchValue {
            endPoint = midPoint - 1
            continue
        } else if arrayCopy[midPoint] < searchValue {
            startingPoint = midPoint + 1
            continue
        }
    }
    print("Value not found")
    return nil
}

