
import Foundation

protocol ElectricitySystem {
    func chargeBattery()
    func checkBatteryLevel()
    var batteryLevel: Double { get set }
  }

protocol ClimateControl {
    func setTemperature(_ temperature: Double)
    func adjustFanSpeed()
    var temperature: Double { get set }
  }

class Camper: ElectricitySystem, ClimateControl {
    var batteryLevel: Double = 0 {
        didSet {
            if batteryLevel < 0 {
                batteryLevel = 0
            } else if batteryLevel > 100 {
                batteryLevel = 100
            }
        }
    }
    var temperature: Double = 0 {
        didSet {
            if temperature < -10 {
                temperature = -10
            } else if temperature > 40 {
                temperature = 40
            }
        }
    }
    
    init() {
        self.batteryLevel = 100 // starts with a full battery
        self.temperature = 24 // starts with a default temperature
    }

    func chargeBattery() {
        if batteryLevel < 100 {
            batteryLevel += 10 // charge by 10%
            print("Battery charged to \(batteryLevel)%")
        } else {
            print("Battery is already fully charged")
        }
    }

    func checkBatteryLevel() {
        print("Battery level is \(batteryLevel)%")
    }

    func setTemperature(_ temperature: Double) {
        self.temperature = temperature
        print("Temperature set to \(temperature)°C")
    }

    func adjustFanSpeed() {
        // Implement logic to adjust fan speed based on temperature
        print("Fan speed adjusted")
    }
}

// Example usage
var camper = Camper()
camper.chargeBattery()
camper.checkBatteryLevel()
camper.chargeBattery()
camper.chargeBattery()
camper.chargeBattery()
camper.checkBatteryLevel()
camper.setTemperature(50) // Temperature will be capped at 40
camper.setTemperature(-20) // Temperature will be capped at -10
camper.setTemperature(25)
camper.adjustFanSpeed()
