////
////  GetDate.swift
////  CollectionViewExample
////
////  Created by DongMin Hwang on 2023/04/07.
////
//
//import Foundation
//
//// 요일을 나타내는 enum
//enum Weekday: String {
//    case sunday = "Sun"
//    case monday = "Mon"
//    case tuesday = "Tue"
//    case wednesday = "Wed"
//    case thursday = "Thu"
//    case friday = "Fri"
//    case saturday = "Sat"
//}
//
//
//// 월을 나타내는 enum
//enum Month: String {
//    case january = "January"
//    case february = "February"
//    case march = "March"
//    case april = "April"
//    case may = "May"
//    case june = "June"
//    case july = "July"
//    case august = "August"
//    case september = "September"
//    case october = "October"
//    case november = "November"
//    case december = "December"
//}
//
//// 현재 날짜와 요일, 월 구하기
//struct CurrentDate {
//    let date: Date
//    let weekday: Weekday
//    let month: Month
//    
//    init() {
//        date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEEE"
//        weekday = Weekday(rawValue: dateFormatter.string(from: date)) ?? .sunday
//        dateFormatter.dateFormat = "MMMM"
//        month = Month(rawValue: dateFormatter.string(from: date)) ?? .january
//    }
//}
//
//// 일주일 날짜, 요일, 월 구하기
//struct WeekDates {
//    let dates: [(date: String, weekday: Weekday, month: Month)]
//    
//    init() {
//        let currentDate = CurrentDate()
//        var weekDays: [(date: String, weekday: Weekday, month: Month)] = []
//        for i in 0..<7 {
//            if let date = Calendar.current.date(byAdding: .day, value: i, to: currentDate.date) {
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "E"
//                let weekday = Weekday(rawValue: dateFormatter.string(from: date)) ?? .sunday
//                dateFormatter.dateFormat = "MMMM"
//                let month = Month(rawValue: dateFormatter.string(from: date)) ?? .january
//                let day = Calendar.current.component(.day, from: date)
//                weekDays.append((date: "\(day)", weekday: weekday, month: month))
//            }
//        }
//        dates = weekDays
//    }
//}
//
//// 결과 출력
//
//
//
//
