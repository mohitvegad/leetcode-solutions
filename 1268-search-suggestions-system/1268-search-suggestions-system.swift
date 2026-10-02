class Solution {
    func suggestedProducts(
        _ products: [String],
        _ searchWord: String
    ) -> [[String]] {
        
        let sortedProducts = products.sorted()
        let characters = Array(searchWord)
        
        var result = [[String]]()
        var prefix = ""
        
        for character in characters {
            prefix.append(character)
            
            var suggestions = [String]()
            
            for product in sortedProducts {
                if product.hasPrefix(prefix) {
                    suggestions.append(product)
                    
                    if suggestions.count == 3 {
                        break
                    }
                }
            }
            
            result.append(suggestions)
        }
        
        return result
    }
}