import UIKit

let queue = OperationQueue()

let subscription = queue
  .publisher(for: \.operationCount)
  .sink {
    print("Outstanding operations in queue: \($0)")
  }


// 1
class TestObject: NSObject {
  // 2
  @objc dynamic var integerProperty: Int = 0
}

let obj = TestObject()

// 3
let subscription2 = obj.publisher(for: \.integerProperty)
  .sink {
  print("integerProperty changes to \($0)_")
}

// 4
obj.integerProperty = 100
obj.integerProperty = 200


