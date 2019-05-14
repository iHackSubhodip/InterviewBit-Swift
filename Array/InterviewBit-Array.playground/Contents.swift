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

