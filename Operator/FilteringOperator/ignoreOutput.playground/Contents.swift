import UIKit
import Combine

var subscriptions = Set<AnyCancellable>()

public func example(of description: String,
                    action: () -> Void) {
  print("\n——— Example of:", description, "———")
  action()
}


example(of: "ignoreOutput") {
  // publisher
  let numbers = ["w", "o", "o", "o", "k", "d", "e","v"].publisher
  
  // sink
  numbers.ignoreOutput()
    .sink(receiveCompletion: { print("Completion event : \($0)")},
          receiveValue: { print($0)} )
    .store(in: &subscriptions)
}

