import UIKit

/*  Max Sum Contiguous Subarray [https://www.interviewbit.com/problems/max-sum-contiguous-subarray/]
 
 1. Question:
 
 Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
 
 For example:
 
 Given the array [-2,1,-3,4,-1,2,1,-5,4],
 
 the contiguous subarray [4,-1,2,1] has the largest sum = 6.
 
 For this problem, return the maximum sum.
 
 */

func maxSubArray(_ A: [Int]) -> Int {
    var maxSoFarResult = Int.min, maxCurrentValue = 0
    
    for i in 0..<A.count{
        maxCurrentValue = maxCurrentValue + A[i]
        if maxSoFarResult < maxCurrentValue{ maxSoFarResult = maxCurrentValue }
        if maxCurrentValue < 0 { maxCurrentValue = 0 }
    }
    
    return maxSoFarResult
}

maxSubArray([-2,1,-3,4,-1,2,1,-5,4])


/*  Repeat and Missing Number Array [https://www.interviewbit.com/problems/repeat-and-missing-number-array/]
 
 2. Question:
 
 You are given a read only array of n integers from 1 to n.
 
 Each integer appears exactly once except A which appears twice and B which is missing.
 
 Return A and B.
 
 Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Note that in your output A should precede B.
 
 Example:
 
 Input:[3 1 2 5 3]
 
 Output:[3, 4]
 
 A = 3, B = 4
 
 */

func repeatedNumber(_ A: [Int]) -> [Int] {
    var numberDictionary = [Int: Int]()
    var duplicate = -1, missing = -1
    
    for intvalue in A{
        if let _ = numberDictionary[intvalue]{
            numberDictionary[intvalue]! += 1
            duplicate = intvalue
        }else {
            numberDictionary[intvalue] = 1
        }
    }
    for i in 0..<A.count{
        guard let _ = numberDictionary[i+1] else {
            missing = i + 1
            return [duplicate, missing]
        }
    }
    
    return [duplicate, missing]
}

repeatedNumber([3,2,1,5,3])


/*  Largest Number [https://www.interviewbit.com/problems/largest-number/]
 
 3. Question:
 
 Given a list of non negative integers, arrange them such that they form the largest number.
 
 For example:
 
 Given [3, 30, 34, 5, 9], the largest formed number is 9534330.
 
 Note: The result may be very large, so you need to return a string instead of an integer.
 
 */

func largestNumber(_ A: [Int]) -> String {
    let result = A.map { "\($0)" }.sorted(by: { $0 + $1 > $1 + $0 })
    return result.first == "0" ? "0" : result.joined()
}

largestNumber([3, 30, 34, 5, 9])

/*  Largest Number [https://www.interviewbit.com/problems/spiral-order-matrix-ii/]
 
 4. Question:
 
 Given an integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.
 
 Example:
 
 Given n = 3,
 
 You should return the following matrix:
 
 [
 [ 1, 2, 3 ],
 [ 8, 9, 4 ],
 [ 7, 6, 5 ]
 ]
 
 */

func generateMatrix(_ A: Int) -> [[Int]] {
    guard A > 0 else { return [[Int]]() }
    var result = Array(repeating: Array(repeating: 0, count: A), count: A)
    var number = 1
    if A == 1{
        result[0][0] = 1
    }
    for layer in 0..<A/2{
        let start = layer
        let end = A - layer - 1
        
        for i in start..<end{
            result[start][i] = number
            number += 1
        }
        
        for i in start..<end{
            result[i][end] = number
            number += 1
        }
        
        for i in stride(from: end, to: start, by: -1){
            result[end][i] = number
            number += 1
        }
        
        for i in stride(from: end, to: start, by: -1){
            result[i][start] = number
            number += 1
        }
        
        if A % 2 != 0 {
            result[A / 2][A / 2] = A * A
        }
    }
    
    return result
}

generateMatrix(3)

/*  First Missing Integer [https://www.interviewbit.com/problems/first-missing-integer/]
 
 5. Question:
 
 Given an unsorted integer array, find the first missing positive integer.
 
 Example:
 
 Given [1,2,0] return 3,
 
 [3,4,-1,1] return 2,
 
 [-8, -7, -6] returns 1
 
 Your algorithm should run in O(n) time and use constant space.
 
 */

func firstMissingPositive(_ A: inout [Int]) -> Int {
    guard A.count > 0 else { return 1 }
    
    for i in 0..<A.count{
        while A[i] >= 1 && A[i] <= A.count && A[A[i] - 1] != A[i]{
            A.swapAt(i, A[i] - 1)
        }
    }
    
    for i in 0..<A.count{
        if A[i] != i + 1{
            return i + 1
        }
    }
    return A.count + 1
}

var arr = [3,4,-1,1]
firstMissingPositive(&arr)


/*  Add One To Number [https://www.interviewbit.com/problems/add-one-to-number/]
 
 6. Question:
 
 Given a non-negative number represented as an array of digits,
 
 add 1 to the number ( increment the number represented by the digits ).
 
 The digits are stored such that the most significant digit is at the head of the list.
 
 Example:
 
 If the vector has [1, 2, 3]
 
 the returned vector should be [1, 2, 4]
 
 as 123 + 1 = 124.
 
 */

func plusOne(_ A: inout [Int]) -> [Int] {
    var index = A.count - 1
    
    if A.first == 0 {
        A.removeFirst()
        index -= 1
    }
    while index >= 0{
        if A[index] < 9{
            A[index] += 1
            return A
        }
        A[index] = 0
        index -= 1
    }
    A.insert(1, at: 0)
    return A
}


var arr1 = [ 0, 3, 7, 6, 4, 0, 5, 5, 5 ]
plusOne(&arr1)
