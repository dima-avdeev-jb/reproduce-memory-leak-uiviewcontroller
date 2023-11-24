import UIKit

var instanceCounter = 0
var aliveInstanceIds = [] as Set<Int>

class MapWidget : UIView {
    let instanceId: Int
    
    // Simulates some memory-heavy stuff like map engine internals
    let mapStuff: [UnsafeMutablePointer<UInt8>]
    
    override init(frame: CGRect) {
        // allocate 50-100 chunks 1-2mb each
        mapStuff = (0 ... Int.random(in: 50...100)).map { _ in
            let capacity = Int.random(in: 1_000_000...2_000_000)
            
            let ptr = UnsafeMutablePointer<UInt8>.allocate(capacity: capacity)
            // Write something inside
            ptr[10] = 5
            return ptr
        }
        
        instanceId = instanceCounter
        aliveInstanceIds.insert(instanceId)
        print("init \(instanceId). Currently alive: \(aliveInstanceIds)")
        instanceCounter += 1
        super.init(frame: frame)
    }
   
    required init?(coder: NSCoder) {
        nil
    }
    
    deinit {
        mapStuff.forEach { it in
            it.deallocate()
        }
        aliveInstanceIds.remove(instanceId)
        print("deinit \(instanceId). Currently alive: \(aliveInstanceIds)")
    }
}
