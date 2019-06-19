import UIKit

let timer = Timer(timeInterval: 1, repeats: true) { _ in
    print("count")
}

RunLoop.current.add(timer, forMode: .default)
timer.fire()
