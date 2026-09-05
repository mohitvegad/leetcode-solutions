class Solution {
    
    let ones = [
        "", "One", "Two", "Three", "Four",
        "Five", "Six", "Seven", "Eight", "Nine",
        "Ten", "Eleven", "Twelve", "Thirteen",
        "Fourteen", "Fifteen", "Sixteen",
        "Seventeen", "Eighteen", "Nineteen"
    ]
    
    let tens = [
        "", "", "Twenty", "Thirty", "Forty",
        "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"
    ]
    
    func numberToWords(_ num: Int) -> String {
        
        if num == 0 {
            return "Zero"
        }
        
        var num = num
        var result = ""
        
        if num >= 1_000_000_000 {
            result += helper(num / 1_000_000_000) + " Billion "
            num %= 1_000_000_000
        }
        
        if num >= 1_000_000 {
            result += helper(num / 1_000_000) + " Million "
            num %= 1_000_000
        }
        
        if num >= 1_000 {
            result += helper(num / 1_000) + " Thousand "
            num %= 1_000
        }
        
        if num > 0 {
            result += helper(num)
        }
        
        return result.trimmingCharacters(in: .whitespaces)
    }
    
    func helper(_ num: Int) -> String {
        
        if num < 20 {
            return ones[num]
        }
        
        if num < 100 {
            if num % 10 == 0 {
                return tens[num / 10]
            }
            
            return tens[num / 10] + " " + ones[num % 10]
        }
        
        let hundred = ones[num / 100] + " Hundred"
        let remainder = num % 100
        
        if remainder == 0 {
            return hundred
        }
        
        return hundred + " " + helper(remainder)
    }
}