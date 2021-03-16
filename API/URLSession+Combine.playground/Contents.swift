import UIKit

import Combine

var str = "Hello, playground"

func test() {
  
}

let url = URL(string: "https://mysite.com/mydata.json")!

// 1
let subscription = URLSession.shared
  // 2
  .dataTaskPublisher(for: url)
  .map(\.data)
  .decode(type: MyType.self, decoder: JSONDecoder())
  .sink { completion in
    // 3
    if case .failure(let err) = completion {
      print("Retrieving data failed with error \(err)")
    }
  } receiveValue: { data, response in
    // 4
    print("Retrieved data of size \(data.count), response = \(response)")
  }

let url2 = URL(string: "https://www.raywenderlich.com")!
let publisher = URLSession.shared
// 1
  .dataTaskPublisher(for: url2)
  .map(\.data)
  .multicast { PassthroughSubject<Data, URLError>() }

// 2
let subscription1 = publisher
  .sink(receiveCompletion: { completion in
          if case .failure(let err) = completion {
            print("Sink1 Retrieving data failed with error \(err)")
          }
  }, receiveValue: { object in
    print("Sink1 Retrieved object \(object)")
  })

// 3
let subscription2 = publisher
  .sink(receiveCompletion: { completion in
    if case .failure(let err) = completion {
      print("Sink2 Retrieving data failed with error \(err)")
    }
  }, receiveValue: { object in
    print("Sink2 Retrieved object \(object)")
  })

// 4
let subscription = publisher.connect()

test()

