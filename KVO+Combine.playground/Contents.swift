import UIKit

let queue = OperationQueue()

let subscription = queue
  .publisher(for: \.operationCount)
  .sink {
    print("Outstanding operations in queue: \($0)")
  }

struct PureSwift {
  let a: (Int, Bool)
}

// 1
class TestObject: NSObject {
  // 2
  @objc dynamic var integerProperty: Int = 0
  @objc dynamic var stringProperty: String = ""
  @objc dynamic var arrayProperty: [Float] = []
  
  // @objc dynamic var structProperty: PureSwift = .init(a: (0, false))
}

let obj = TestObject()

// 3
let subscription2 = obj.publisher(for: \.integerProperty)
  .sink {
    print("integerProperty changes to \($0)")
  }

let subscription3 = obj.publisher(for: \.stringProperty)
  .sink {
    print("stringProperty changes to \($0)")
  }

let subscription4 = obj.publisher(for: \.arrayProperty)
  .sink {
    print("arrayProperty changes to \($0)")
  }


// 4
obj.integerProperty = 100
obj.integerProperty = 200

obj.stringProperty = "Hello"
obj.arrayProperty = [1.0]
obj.stringProperty = "World"
obj.arrayProperty = [1.0, 2.0]


