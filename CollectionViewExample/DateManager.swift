import Foundation

struct DateInfo {
    let month: String
    let day: Int
    let weekday: String
}

enum Weekday: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    var shortName: String {
        switch self {
        case .sunday: return "Sun"
        case .monday: return "Mon"
        case .tuesday: return "Tue"
        case .wednesday: return "Wed"
        case .thursday: return "Thu"
        case .friday: return "Fri"
        case .saturday: return "Sat"
        }
    }
}

enum Month: Int {
    case january = 1, february, march, april, may, june, july, august, september, october, november, december
    
    var name: String {
        switch self {
        case .january: return "January"
        case .february: return "February"
        case .march: return "March"
        case .april: return "April"
        case .may: return "May"
        case .june: return "June"
        case .july: return "July"
        case .august: return "August"
        case .september: return "September"
        case .october: return "October"
        case .november: return "November"
        case .december: return "December"
        }
    }
}

class DateManager  {
    static let shared = DateManager()
    func getDateInfo() -> DateInfo {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: today)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError("Could not get date from string.")
        }
        dateFormatter.dateFormat = "dd"
        let dayString = dateFormatter.string(from: date)
        guard let day = Int(dayString) else {
            fatalError("Could not get day from string.")
        }
        dateFormatter.dateFormat = "EEEE"
        let weekdayString = dateFormatter.string(from: date)
        
        return DateInfo(month: Month(rawValue: Calendar.current.component(.month, from: date))!.name, day: day, weekday: Weekday(rawValue: Calendar.current.component(.weekday, from: date))!.shortName)
    }
    
    func getWeekDateInfo() -> [DateInfo] {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: today)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError("Could not get date from string.")
        }
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        guard let startOfWeek = calendar.date(from: components) else {
            fatalError("Could not get start of week.")
        }
        var dayComponents = DateComponents()
        var weekDateInfo: [DateInfo] = []
        for day in 0..<7 {
            dayComponents.day = day
            guard let nextDate = calendar.date(byAdding: dayComponents, to: startOfWeek) else {
                fatalError("Could not get next date.")
            }
            dateFormatter.dateFormat = "dd"
            let dayString = dateFormatter.string(from: nextDate)
            guard let day = Int(dayString) else {
                fatalError("Could not get day from string.")
            }
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.dateFormat = "EEEE, MMMM" // 변경된 부분
            let weekdayMonthString = dateFormatter.string(from: nextDate)
            let weekdayMonthArray = weekdayMonthString.components(separatedBy: ", ")
            guard weekdayMonthArray.count == 2 else {
                fatalError("Could not get weekday and month from string.")
            }
            let weekday = weekdayMonthArray[0]
            let month = weekdayMonthArray[1]
            weekDateInfo.append(DateInfo(month: month, day: day, weekday: weekday))
        }
        return weekDateInfo
    }


    
}
