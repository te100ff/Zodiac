//
//  Person.swift
//  Zodiac
//
//  Created by Виталий Оранский on 23.04.2021.
//

import Foundation

struct Person {
    let name: String
    let lastName: String
    let dayOfBirth: String
    let dateOfBirth: Date
    
    var zodiac: ZodiacSign {
        ZodiacSign(rawValue: getZodiak(dayOfBirth: dateOfBirth))!
    }
    
    var zodiacDiscription: String {
        getZodiacDiscription(zodiac: zodiac)
    }
    
    var zodiacEmoji: Character {
        getZodiacEmoji(zodiac: zodiac)
    }
    // Вернет описание знака Зодиака как строку
    private func getZodiacDiscription(zodiac: ZodiacSign) -> String {
        
        
        switch zodiac {
        
        case .aries:
            return "Овен олицетворяет решительность, оптимизм и в то же время несдержанность, раздражительность."
        case .taurus:
            return "Телец – символ доброжелательности, терпеливости, а также упрямства и медлительности."
        case .gemini:
            return "Близнецы символизируют активность, тягу к самосовершенствованию и в то же время непостоянство, двойственность."
        case .cancer:
            return "Рак олицетворяет как чувствительность, мягкость, так и чрезмерную эмоциональность и скрытность."
        case .leo:
            return "Лев символизирует жизненную силу, оптимизм, а также тщеславие и высокомерие."
        case .virgo:
            return "Дева олицетворяет рассудительность, человечность и вместе с тем язвительность, критичность."
        case .libra:
            return "Весы символизируют движение к совершенству, целеустремленность, уравновешенность, а также упрямство и хвастливость."
        case .scorpio:
            return "Скорпион олицетворяет целеустремленность, страстность и в то же время раздражительность, жесткость."
        case .sagittarius:
            return "Стрелец символизирует, с одной стороны, энергичность, свободолюбие, а с другой – нетерпеливость, прямолинейность."
        case .capricorn:
            return "Козерог олицетворяет целеустремленность, спокойствие и в то же время замкнутость, эмоциональную сдержанность."
        case .aquarius:
            return "Водолей символизирует, с одной стороны, тягу к получению новых знаний, человечность, а с другой – неоднозначность, непредсказуемость."
        case .pisces:
            return "Рыбы олицетворяют чувствительность, страстность, мягкосердечие, а также замкнутость, ранимость, нетерпимость к критике."
        }
    }
    // Вернет знак Зодиака как строку из Date
    private func getZodiak(dayOfBirth: Date) -> String {
    
            let zodiakDic = ["Овен": ["03/21", "04/20"], "Телец": ["04/21", "05/21"],
                             "Близнецы": ["05/22", "06/21"], "Рак": ["06/22", "07/22"],
                             "Лев": ["07/23", "08/21"], "Дева": ["08/22", "09/23"],
                             "Весы": ["09/24", "10/23"], "Скорпион": ["10/24", "11/22"],
                             "Стрелец": ["11/23", "12/22"],
                             "Водолей": ["01/21", "02/19"], "Рыбы": ["02/20", "03/20"]]
    
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd"
    
            let calendar = Calendar.current
            let dateComponents = Calendar.current.dateComponents([.month, .day], from: dayOfBirth)
            let shortDate = calendar.date(from: dateComponents)
    
            for zodiak in zodiakDic {
    
                let dateMin = formatter.date(from: zodiak.value.first!)
                let minDateCompontnts = Calendar.current.dateComponents([.month, .day], from: dateMin!)
                let realMindate = calendar.date(from: minDateCompontnts)
                let dateMax = formatter.date(from: zodiak.value.last!)
                let maxDateCompontnts = Calendar.current.dateComponents([.month, .day], from: dateMax!)
                let realMaxdate = calendar.date(from: maxDateCompontnts)
    
                if (realMindate!...realMaxdate!).contains(shortDate!) {
                    return zodiak.key
                }
            }
            return "Козерог"
        }
    // Вернет Emoji знака Зодиака как Character
    private func getZodiacEmoji(zodiac: ZodiacSign) -> Character {
        
        switch zodiac {
        
        case .aries:
            return "♈️"
        case .taurus:
            return "♉️"
        case .gemini:
            return "♊️"
        case .cancer:
            return "♋️"
        case .leo:
            return "♌️"
        case .virgo:
            return "♍️"
        case .libra:
            return "♎️"
        case .scorpio:
            return "♏️"
        case .sagittarius:
            return "♐️"
        case .capricorn:
            return "♑️"
        case .aquarius:
            return "♒️"
        case .pisces:
            return "♓️"
        }
    }
    // Вернет 10 друзей с рандомными датами
    static func getFriends() -> [Person]{
        var persons = [Person]()
        
        var randomInt = 0.0
        var date = Date(timeIntervalSince1970: randomInt)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "MMMM d y"
        
        let dataNames = DataManager().names.shuffled()
        let dataSurnames = DataManager().surnames.shuffled()
        
        for index in 0..<min(dataNames.count, dataSurnames.count) {
            randomInt = Double.random(in: 1...1600000000)
            date = Date(timeIntervalSince1970: randomInt)
            
            
            
            let beautifulDate = formatter.string(from: date)
            
            
            persons.append(Person(name: dataNames[index],
                                  lastName: dataSurnames[index],
                                  dayOfBirth: beautifulDate,
                                  dateOfBirth: date))
        }
        
        return persons
    }
    
    
    
}

enum ZodiacSign: String {
    case aries = "Овен"
    case taurus = "Телец"
    case gemini = "Близнецы"
    case cancer = "Рак"
    case leo = "Лев"
    case virgo = "Дева"
    case libra = "Весы"
    case scorpio = "Скорпион"
    case sagittarius = "Стрелец"
    case capricorn = "Козерог"
    case aquarius = "Водолей"
    case pisces = "Рыбы"
}
