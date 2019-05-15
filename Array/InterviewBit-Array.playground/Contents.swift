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




