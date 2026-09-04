class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        let boxes = boxTypes.sorted {
            $0[1] > $1[1]
        }
        
        var space = truckSize
        var units = 0
        
        for box in boxes {
            let numberOfBoxes = box[0]
            let unitsPerBox = box[1]
            
            let take = min(space, numberOfBoxes)
            
            units += take * unitsPerBox
            space -= take
            
            if space == 0 {
                break
            }
        }
        
        return units
    }
}