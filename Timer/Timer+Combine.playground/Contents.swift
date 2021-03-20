import UIKit
import Combine

let runLoop = RunLoop.main

let subscription = runLoop.schedule(
  after: runLoop.now,
  interval: .seconds(1),
  tolerance: .milliseconds(100)
) {
  print("Timer fired")
}


runLoop.schedule(after: .init(Date(timeIntervalSinceNow: 3.0))) {
  subscription.cancel()
}

let publisher = Timer
  .publish(every: 1.0, on: .main, in: .common)
  .autoconnect()

let subscription2 = Timer
  .publish(every: 1.0, on: .main, in: .common)
  .autoconnect()
  .scan(0, { counter, _ in counter + 1 })
  .sink { counter in
    print("Counter is \(counter)")
  }
