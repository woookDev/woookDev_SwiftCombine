import UIKit

let request = URLSession.shared
  .dataTaskPublisher(for: URL(string: "https://www.raywenderlich.com/")!)

let subscription = request
  .handleEvents(receiveSubscription: { _ in
    print("Network request will start")
  }, receiveOutput: { _ in
    print("Network request data received")
  }, receiveCancel: {
    print("Network request cancelled")
  })
  .sink { completion in
  print("Sink received completion")
} receiveValue: { (data, _) in
  print("Sink received data: \(data)")
}

