//
//  main.swift
//  Swift_basics_l3
//
//  Created by Victor Lipov on 01.06.2021.
//

import Foundation

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

struct Car {
    let model: String
    let year: Int
    let trunkSizeTotal: Int
    var engineRunning: Bool {
        didSet {
            print("Было", oldValue, "Стало", engineRunning)
        }
    }
    var windowsOpen: Bool {
        didSet {
            print("Было", oldValue, "Стало", windowsOpen)
        }
    }
    var loadedGoods: Int {
        didSet {
            print("Было", oldValue, "Стало", loadedGoods)
        }
    }

    
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

    enum CarActions: String {
        case engineStart = "Двигатель заведен"
        case engineStop = "Двигатель заглушен"
        case windowsOpen = "Окна открыты"
        case windowsClose = "Окна закрыты"
    }
    
    enum TrunkAction {
        case loadTrunk
        case unloadTrunk
    }

    
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

    mutating func doWithCar(_ mode: CarActions) {
        print(mode.rawValue)
        switch mode {
        case .engineStart:
            self.engineRunning = true
        case .engineStop:
            self.engineRunning = false
        case .windowsOpen:
            self.windowsOpen = true
        case .windowsClose:
            self.windowsOpen = false
        }

    }
    
    mutating func loadUnload(_ mode: TrunkAction, size: Int) {
        switch mode {
        case .loadTrunk:
            if self.trunkSizeTotal - self.loadedGoods >= size {
                self.loadedGoods += size
            } else {
                print("Недостаточно места для погрузки")
                print("Для погрузки доступно \(self.trunkSizeTotal - self.loadedGoods)")
            }
        case .unloadTrunk:
            if ((self.loadedGoods - size) >= 0) {
                self.loadedGoods -= size
            } else {
                print("Нет такого объема для разгрузки")
                print("Доступно для разгрузки \(self.loadedGoods)")
            }
    }
    }

}


//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

//6. Вывести значения свойств экземпляров в консоль.

var sportCar = Car(model: "BMW", year: 2020, trunkSizeTotal: 500, engineRunning: false, windowsOpen: false, loadedGoods: 0)

var truckCar = Car(model: "Kamaz", year: 2010, trunkSizeTotal: 20000, engineRunning: true, windowsOpen: false, loadedGoods: 0)

sportCar.doWithCar(.engineStop)
sportCar.loadUnload(.loadTrunk, size: 490)
sportCar.loadUnload(.unloadTrunk, size: 200)
sportCar.loadUnload(.unloadTrunk, size: 300)

truckCar.doWithCar(.windowsOpen)






