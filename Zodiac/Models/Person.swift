//
//  Person.swift
//  Zodiac
//
//  Created by Zodiac crew on 23.04.2021.
//

import Foundation

struct Person {
    let name: String
    let lastName: String
    let dayOfBirth: String
    let dateOfBirth: Date
    
    var fullName: String {
        return "\(name) \(lastName)"
    }
    
    var zodiac: ZodiacSign {
        ZodiacSign(rawValue: getZodiak(dayOfBirth: dateOfBirth))!
    }
    
    var zodiacDiscription: String {
        getZodiacDiscription(zodiac: zodiac)
    }
    
    var zodiacEmoji: Character {
        getZodiacEmoji(zodiac: zodiac)
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
        return ""
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
    static func getFriends() -> [Person] {
        var persons = [Person]()
        
        var randomInt = 0.0
        var date = Date(timeIntervalSince1970: randomInt)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMMM y"
        
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
    
    // Вернет описание знака Зодиака как строку
    private func getZodiacDiscription(zodiac: ZodiacSign) -> String {
        
        
        switch zodiac {
        
        case .aries:
            return """
            Смотрит на людей сверху вниз. Выражение лица самодовольное. Говорит то, что думает, и делает то, что говорит. Делает хреново, но никогда не обсуждает это. Если осмелитесь указать Овну на его промахи - берегитесь: ваши почки могут оказаться у вас перед носом.

            Овны и Рыбы - неразлучная парочка. Только рядом с Рыбами они чувствуют свое превосходство. Овны не нуждаются в воспитании. Даже новорожденные Овны - вполне самостоятельные и психически сформированные личности.

            Овен женится несколько раз, но никогда не разводится. Их супруги уходят из жизни самым странным образом, после этого Овну вновь приходиться искать себе пару.

            Овен очень часто знаимает руководящие должности. Его удовлетворит даже звание "главного по уборке туалетов". Приближение Овна вызывает страх и панику среди подчиненых, особенно если они не выполнили его поручение. За это Овен их просто уничтожит.

            Овны еще более эгоистичны, чем Скорпионы. На самом деле они – самые вредные из всех знаков зодиака.
            """
        case .taurus:
            return """
                Настроение у них изменчивое: вот они злятся и сыпят проклятиями, через минуту – смеются как ни в чем не бывало. Но их улыбка обманчива: уже в следующую секунду Тельцы спокойно могут выстрелить оппоненту в коленную чашечку.

                Тельцы не любят витать в облаках, они твердо стоят на земле. Зато обожают смотреть фильмы со счастливым концом, им нравится веселиться и хорошо проводить время. Именно Телец чаще всего оказывается тем парнем, кто подрался с официантом или разгромил ресторан.

                Тельцы - люди странные, они всегда чем-то недовольны. Возможно, тем, что в зодиаке занимают лишь вторую строчку. А это вредит их имиджу. Так хочется быть во всем первым!

                Все Тельцы хотят власти. Выяснить у них что-либо очень сложно: на каждый вопрос они отвечают вопросом. Тельцы - любители поскандалить. Если у всех все хорошо, то это уже напрягает. Где конфликт, где драки, где эмоции?

                Если зацепить никого не удалось, Телец впадает в уныние и начинает анализировать сначала себя, а потом добирается и до друзей.

                Тельцы нетерпеливы и настойчивы. Они вечно спешат, никуда в конечном итоге не успевают, но главное ведь - намерение?
                """
        case .gemini:
            return """
                Близнецов любят все. А кто ж не любит шизофреников? Им нравится думать, что они – какая-то особая помесь Сократа и Микеланджело. Близнецы - люди настойчивые и властные. Людей, родившихся под знаком Весы, они используют как козлов отпущения.

                Сначала Близнецы выстраивают жизнь и быт, а потом с удовольствием все уничтожают. Развлечение у них такое. Они редко участвуют в Олимпийских Играх. У Близнецов всегда все хорошо, ведь они "молодцы". Главное чаще это повторять.

                Близнецы говорят очень громко - хотят, чтобы их услышали. Неважно, что со стороны это смотрится глупо - окружающим кажется, что они говорят сами с собой. Близнец – по сути не что иное, как Водолей с параноидальным расстройством личности.
                """
        case .cancer:
            return """
                Раков интересует все вокруг, только не своя собственная жизнь. О том, что Рак выиграл в лотерею, он узнает от друзей. У Раков особый стиль в одежде - пофигистический, им все равно, что носить. Им незачем гладить одежду: за пару часов она сама на них разгладится.

                Одной пары белья им хватит на месяц. Раки любят уединение, они могут жить в затворничестве годами. Именно поэтому почти у всех Раков врожденный талант к вышивке крестиком. Они те люди, которые стремятся к миру во всем мире.

                Спортивные достижения Ракам не светят - даже после пятнадцатиминутной прогулки им требуется длительный отдых. Раки мечтают о том, чтобы карьеру можно было делать, лежа в постели.

                Здоровое питание для Раков - это гамбургеры и пиво. Душевные раны они лечат домашним супом и уединением. Именно Ракам поручают развести пьяных друзей по домам после вечеринки. Эти друзья чаще всего – Рыбы.
                """
        case .leo:
            return """
                Львы жаждут внимания. Чингисхан был Львом и этим все сказано. Львы без малейшего угрызения совести готовы прервать чужую беседу, чтобы начать свой монолог. И только попробуйте покинуть помещение, когда вещают Львы!

                Все Львы мечтают о том, чтобы в их день рождения устраивались парады, и все это великолепное действо транслировалось по телевизору. Если они действительно женятся, то чаще всего их супруги – тихие и забитые существа, годные только на то, чтобы приносить тапочки великому Льву.

                Но на самом деле Львы - слишком самовлюбленные существа, поэтому в любви им не везет. Вот мы и нашли объяснение тому, почему столько людей, арестованных за некрофилию, по знаку зодиака Львы.

                Эти люди и ведут себя как львы: громко рычат (то есть говорят), излучают уверенность, без малейшего стеснения ссут под деревом, если очень уж приспичило. Смирение - это не про Львов. «Радикальные культовые лидеры» - вот идеальные слова для описания их характера.

                У Водолеев стены обвешаны плакатами рок-звезд, у Скорпионов – стихийных бедствий, у Козерогов – великих математиков, у Рыб – единорогов, и только у Львов на стенах висят плакаты самих себя любимых. И чем крупнее изображение, тем лучше.
                """
        case .virgo:
            return """
                Девы – заноза в заднице для обычных людей. Одежда в их шкафу разложена по цвету. Они неисправимые чистюли! Каждый квадратный сантиметр квартиры Девы вычищают как минимум два раза в день. Зубной щеткой.

                Их привычное место - на полу с лупой в руках: именно в таком положении Девы проводят досуг - проверяют поверхность на наличие микробов.

                Девы рождаются с синдромом навязчивых состояний. На допросе в полицейском участке Дева в первую очередь расскажет следователю, какие грязные руки были у грабителя, а уж потом перейдет к сути дела.

                Хотите повеселиться? Скажите Деве, что между зубами у нее что-то застряло. Все - можете часами наблюдать, как она отчаянно пытается вычистить это «воображаемое нечто». Для Дев не существует белого и черного, для них есть только чистое и грязное.
                """
        case .libra:
            return """
                Вы постоянно колеблетесь - то в одну, то в другую сторону. К принятию решения вы подключите врача или же прослушаете авторитетного эксперта, поговорите с соседкой, а потом с маникюрщицей и т.д. - только чтобы оттянуть момент истины.

                Весы не любят благотворительность. Они предпочитают покупать дорогую обувь, не едят фаст-фуд, а брюки подбирают в тон водолазке.

                И вообще, представители этого знака обожают собирать всякий хлам, за которым ревностно следят. В Голливуде полно Весов. Именно из-за вас в моду время от времени возвращаются шпильки, бабочки и штаны-парашюты.

                Как бы много Весы не выпили, они всегда в состоянии объяснить, чем отличается кофе латте от кофе с молоком. Только Весы чувствуют эту тонкую грань, остальной части человечества откровенно плевать.
                """
        case .scorpio:
            return """
                Большинство хакеров – Скорпионы. Вы боитесь, что вас похитят инопланетяне или правительство. Как ни странно, Билл Гейтс – Скорпион. У вас есть собственный план по захвату мировой власти. Не дай Бог такое время когда-нибудь наступит!

                Скорпионов природа одарила мощным либидо. Они увлекаются такими личностями, на которых без слез не взглянешь. За что им такое наказание – до сих пор неизвестно. Скорпионы не очень любят расставаться с растительностью на теле - иначе теряют уверенность в себе. Особенно это касается женщин Скорпионов.
                """
        case .sagittarius:
            return """
                Стрельцы – прирожденные авантюристы. Им нравится давить пауков голыми руками. Они не ищут легких путей. Для того, чтобы развлечь близких и знакомых, Стрельцы готовы на все - даже превратиться в трансвестита.

                Почти каждый Стрелец ощущает себя не в своем теле. Стрельцы - люди простые и даже неотесанные, в них нет никакого лоска. Редко кому из взрослых нравится общество Стрельцов. Лучшая компания для них - животные и маленькие дети.

                Из Стрельцов выходят прекрасные цирковые артисты и бродяги. Они бросаются едой в дорогих ресторанах и задают слишком много вопросов в церкви. Не знакомьте Стрельца с родителям - или сразу женитесь, или бросайте его.
                """
        case .capricorn:
            return """
                Козероги трудолюбивы и надежны. Но с ними очень скучно. Весело Козерогам только в обнимку с учебником математики. Декарт был великим математиком и скучным философом, вывод напрашивается сам собой- наверняка он был Козерогом.

                Большинство политиков – Козероги. Вот почему наша страна находится в полной ж… Козероги - своеобразная помесь Льва и Девы. Они считают себя харизматичными и очень рассудительными. В реальности с ними так же трудно, как со Львами, и так же скучно, как с Девами.

                В случае ядерной войны в живых останутся только тараканы и Козероги. Большинство преступников, подделывающих что угодно, - Козероги.
                """
        case .aquarius:
            return """
                Водолей любит потрындеть. «В любое время и в любом месте» - вот его девиз. Водолеи склонны ностальгировать о своем детстве, и то лишь потому, что в то время они могли спокойно бегать голышом.

                Практически все Водолеи - путешественники во времени: они постоянно летают в облаках, возвращяясь в прошлое или устремляясь в будущее. Если вы говорите с Водолеем и видите, что он смотрит сквозь вас, можете спокойно отправиться по своим делам. Он этого и не заметит.

                Водолеи любят направлять людей на путь истинный. Они знают все и обо всем на свете. Если вы хотите знать, на что похожа еда на Сатурне – спросите Водолея. Им наплевать на всех, они с рождения наделены колоссальным самомнением. Большинство рок-звезд – Водолеи.
                """
        case .pisces:
            return """
                Водолей любит потрындеть. «В любое время и в любом месте» - вот его девиз. Водолеи склонны ностальгировать о своем детстве, и то лишь потому, что в то время они могли спокойно бегать голышом.

                Практически все Водолеи - путешественники во времени: они постоянно летают в облаках, возвращяясь в прошлое или устремляясь в будущее. Если вы говорите с Водолеем и видите, что он смотрит сквозь вас, можете спокойно отправиться по своим делам. Он этого и не заметит.

                Водолеи любят направлять людей на путь истинный. Они знают все и обо всем на свете. Если вы хотите знать, на что похожа еда на Сатурне – спросите Водолея. Им наплевать на всех, они с рождения наделены колоссальным самомнением. Большинство рок-звезд – Водолеи.
                """
        }
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
