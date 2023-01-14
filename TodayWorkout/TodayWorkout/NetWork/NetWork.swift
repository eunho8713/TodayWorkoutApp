//
//  NetWork.swift
//  TodayWorkout
//
//  Created by 이은호 on 2022/12/27.
//

import Foundation

class NetWork: TodayWorkoutAPI {
    func getDefalutData() -> String {
        let url = TodayWorkoutUrl.domain + TodayWorkoutUrl.path + TodayWorkoutUrl.serviceKey
        return url
    }
    
    
    
    
}
