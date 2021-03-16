import UIKit

var str = "Hello, playground"

func test() {
  
}

let url = URL(string: "https://mysite.com/mydata.json")!

// 1
let subscription = URLSession.shared
  // 2
  .dataTaskPublisher(for: url)
  .tryMap { data, _ in
    try JSONDecoder().decode(MyType.self, from: data)
  }
  .sink { completion in
    // 3
    if case .failure(let err) = completion {
      print("Retrieving data failed with error \(err)")
    }
  } receiveValue: { data, response in
    // 4
    print("Retrieved data of size \(data.count), response = \(response)")
  }

test()

