//
//  TemperatureFunctions.swift
//  Converter-Challenge1
//
//  Created by Luthfor Khan on 12/9/21.
//

import Foundation

let temperatureUnits = ["°C", "°F", "K"]

func tempVal(userValue: Double, userUnits: String, desiredUnits: String) -> Double {
    
    if(userUnits == desiredUnits){
        return (userValue)
    }
    
    if (userUnits == temperatureUnits[0]) {
        if (desiredUnits == temperatureUnits[1]) {
            return (convertToF(value: userValue, baseUnits: userUnits))
        } else if (desiredUnits == temperatureUnits[2]) {
            return (convertToK(value: userValue, baseUnits: userUnits))
        }
    } else if (userUnits == temperatureUnits[1]) {
        if (desiredUnits == temperatureUnits[0]) {
            return (convertToC(value: userValue, baseUnits: userUnits))
        } else if (desiredUnits == temperatureUnits[2]) {
            return (convertToK(value: userValue, baseUnits: userUnits))
        }
    } else if (userUnits == temperatureUnits[2]) {
        if (desiredUnits == temperatureUnits[0]) {
            return (convertToC(value: userValue, baseUnits: userUnits))
        } else if (desiredUnits == temperatureUnits[1]) {
            return (convertToF(value: userValue, baseUnits: userUnits))
        }
    }
    
    return (0.0)
}

func convertToC(value: Double, baseUnits: String) -> Double {
    if (baseUnits == temperatureUnits[1]) {
        return ((value - 32) * (5/9))
    } else {
        return (value -  273.15)
    }
}

func convertToK(value: Double, baseUnits: String) -> Double {
    if (baseUnits == temperatureUnits[1]) {
        return (((value - 32) * (5/9)) + 273.15)
    } else {
        return (value +  273.15)
    }
}

func convertToF(value: Double, baseUnits: String) -> Double {
    if (baseUnits == temperatureUnits[0]) {
        return (value * (9/5) +  32)
    } else {
        return ((value -  273.15) * (9/5) +  32)
    }
}
