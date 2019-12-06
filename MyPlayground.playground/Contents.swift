import UIKit

//Задание 1

enum CarError: Error {
    case noSpoiler
    case noMusic
    case noPlaceInTank(volumeExcess: Int)
}

class Car {
    let hasSpoiler: Bool
    let hasMusic: Bool
    let tankVolume: Int
    var spoilerIsOn: Bool = false
    var musicIsOn: Bool = false
    var fuelInTank: Int = 0
    
    
    init(hasSpoiler: Bool, hasMusic: Bool, tankVolume: Int) {
        self.hasSpoiler = hasSpoiler
        self.hasMusic = hasMusic
        self.tankVolume = tankVolume
    }
    
    func raiseSpoiler() throws {
        guard hasSpoiler else {
            throw CarError.noSpoiler
        }
        spoilerIsOn = true
    }
    
    func turnMusicOn() throws {
        guard hasMusic else {
            throw CarError.noMusic
        }
        musicIsOn = true
    }
    
    func addFuelToTank(volume: Int) throws {
        guard (fuelInTank + volume) <= tankVolume else {
            throw CarError.noPlaceInTank(volumeExcess: fuelInTank + volume - tankVolume)
        }
        fuelInTank += volume
    }
}

print("Задание 1")

let car = Car(hasSpoiler: true, hasMusic: true, tankVolume: 50)

do {
    try car.raiseSpoiler()
    try car.turnMusicOn()
    try car.addFuelToTank(volume: 53)
    print("Все операции выполнены без ошибок")
} catch CarError.noSpoiler {
    print("Антикрыло отсутствует")
} catch CarError.noMusic {
    print("Магнитола отсутствует")
} catch CarError.noPlaceInTank(let exceeded) {
    print("Превышение объема - \(exceeded) л")
}

//Задание 2
class Car2 {
    let hasSpoiler: Bool
    let hasMusic: Bool
    let tankVolume: Int
    var spoilerIsOn: Bool = false
    var musicIsOn: Bool = false
    var fuelInTank: Int = 0
    
    
    init(hasSpoiler: Bool, hasMusic: Bool, tankVolume: Int) {
        self.hasSpoiler = hasSpoiler
        self.hasMusic = hasMusic
        self.tankVolume = tankVolume
    }
    
    func raiseSpoiler() -> CarError? {
        guard hasSpoiler else {
            return CarError.noSpoiler
        }
        spoilerIsOn = true
        return nil
    }
    
    func turnMusicOn() -> CarError? {
        guard hasMusic else {
            return CarError.noMusic
        }
        musicIsOn = true
        return nil
    }
    
    func addFuelToTank(volume: Int) -> CarError? {
        guard (fuelInTank + volume) <= tankVolume else {
            return CarError.noPlaceInTank(volumeExcess: fuelInTank + volume - tankVolume)
        }
        fuelInTank += volume
        return nil
    }
}

func testResult(res: CarError?) {
    if res == nil {
        print("Операция прошла без ошибок")
        return
    }
    
    switch res! {
    case .noSpoiler:
        print("Антикрыло отсутствует")
    case .noMusic:
        print("Магнитола отсутствует")
    case .noPlaceInTank(let exceeded):
        print("Превышение объема - \(exceeded) л")
    }
}

print("Задание 2")

let car2 = Car2(hasSpoiler: false, hasMusic: true, tankVolume: 60)

testResult(res: car2.turnMusicOn())
testResult(res: car2.raiseSpoiler())
testResult(res: car2.addFuelToTank(volume: 61))

