import UIKit
import Combine

let subscription = (1...3).publisher
  .print()
  .sink { _ in }
