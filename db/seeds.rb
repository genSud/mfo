# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# создаем роли

Role.create(name: :admin, title:'Администратор')
Role.create(name: :agent, title:'Агент')
Role.create(name: :client, title:'Клиент')
Role.create(name: :guest, title:'Гость')

# создадим суперадмина
superadmin = User.create(name:"Главный", email:"superadmin@mail.ru", password:"rHA24PSsul", password_confirmation:"rHA24PSsul", active: true);
UsersRole.create user:superadmin, role: (Role.find_by_name :admin)

# Platform.create(name:"Сбербанк-АСТ",number:"1")
# Platform.create(name:"Росселторг",number:"2")
# Platform.create(name:"ММВБ",number:"3")


#Streets types

StreetType.create( name:"аллея", code:"01" )
StreetType.create( name:"бульвар", code:"02" )
StreetType.create( name:"въезд", code:"03" )
StreetType.create( name:"дорога", code:"04" )
StreetType.create( name:"заезд", code:"05" )
StreetType.create( name:"казарма", code:"06" )
StreetType.create( name:"квартал", code:"07" )
StreetType.create( name:"км", code:"08" )
StreetType.create( name:"кольцо", code:"09" )
StreetType.create( name:"линия", code:"10" )

StreetType.create( name:"м", code:"11" )
StreetType.create( name:"мкр", code:"12" )
StreetType.create( name:"наб", code:"13" )
StreetType.create( name:"парк", code:"14" )
StreetType.create( name:"пер", code:"15" )
StreetType.create( name:"переезд", code:"16" )
StreetType.create( name:"пл", code:"17" )
StreetType.create( name:"пл-ка", code:"18" )
StreetType.create( name:"пр-кт", code:"19" )
StreetType.create( name:"проезд", code:"20" )

StreetType.create( name:"просек", code:"21" )
StreetType.create( name:"проселок", code:"22" )
StreetType.create( name:"проулок", code:"23" )
StreetType.create( name:"стр", code:"24" )
StreetType.create( name:"тер", code:"25" )
StreetType.create( name:"тракт", code:"26" )
StreetType.create( name:"туп", code:"27" )
StreetType.create( name:"ул", code:"28" )
StreetType.create( name:"уч-к", code:"29" )
StreetType.create( name:"шоссе", code:"30" )


#Regions

Region.create( name:"Агинский Бурятский авт. округ", code:"80")
Region.create( name:"Алтайский край", code:"22")
Region.create( name:"Амурская обл.", code:"28")
Region.create( name:"Архангельская обл.", code:"29")
Region.create( name:"Астраханская обл.", code:"30")
Region.create( name:"Байконур", code:"99")
Region.create( name:"Белгородская обл.", code:"31")
Region.create( name:"Брянская обл.", code:"32")
Region.create( name:"Владимирская обл.", code:"33")
Region.create( name:"Волгоградская обл.", code:"34")

Region.create( name:"Вологодская обл.", code:"35")
Region.create( name:"Воронежская обл.", code:"36")
Region.create( name:"г. Москва", code:"77")
Region.create( name:"г. Санкт-Петербург", code:"78")
Region.create( name:"Еврейская авт. обл.", code:"79")
Region.create( name:"Ивановская обл.", code:"37")
Region.create( name:"Ингушская Республика", code:"06")
Region.create( name:"Иркутская обл.", code:"38")
Region.create( name:"Кабардино-Балкарская Республика", code:"07")
Region.create( name:"Калининградская обл.", code:"39")

Region.create( name:"Калужская обл.", code:"40")
Region.create( name:"Камчатская обл.", code:"41")
Region.create( name:"Карачаево-Черкесская Республика", code:"09")
Region.create( name:"Кемеровская обл.", code:"42")
Region.create( name:"Кировская обл.", code:"43")
Region.create( name:"Коми-Пермяцкий авт. округ", code:"81")
Region.create( name:"Корякский авт. округ", code:"82")
Region.create( name:"Костромская обл.", code:"44")
Region.create( name:"Краснодарский край", code:"23")
Region.create( name:"Красноярский край", code:"24")

Region.create( name:"Курганская обл.", code:"45")
Region.create( name:"Курская обл.", code:"46")
Region.create( name:"Ленинградская обл.", code:"47")
Region.create( name:"Липецкая обл.", code:"48")
Region.create( name:"Магаданская обл.", code:"49")
Region.create( name:"Московская обл.", code:"50")
Region.create( name:"Мурманская обл.", code:"51")
Region.create( name:"Ненецкий авт. округ", code:"83")
Region.create( name:"Нижегородская обл.", code:"52")
Region.create( name:"Новгородская обл.", code:"53")

Region.create( name:"Новосибирская обл.", code:"54")
Region.create( name:"Омская обл.", code:"55")
Region.create( name:"Оренбургская обл.", code:"56")
Region.create( name:"Орловская обл.", code:"57")
Region.create( name:"Пензенская обл.", code:"58")
Region.create( name:"Пермская обл.", code:"59")
Region.create( name:"Приморский край", code:"25")
Region.create( name:"Псковская обл.", code:"60")
Region.create( name:"Республика Адыгея", code:"01")
Region.create( name:"Республика Башкортостан", code:"02")

Region.create( name:"Республика Бурятия", code:"03")
Region.create( name:"Республика Горный Алтай", code:"04")
Region.create( name:"Республика Дагестан", code:"05")
Region.create( name:"Республика Калмыкия-Хальмг Тангч", code:"08")
Region.create( name:"Республика Карелия", code:"10")
Region.create( name:"Республика Коми", code:"11")
Region.create( name:"Республика Марий ЭЛ", code:"12")
Region.create( name:"Республика Мордовия", code:"13")
Region.create( name:"Республика Саха (Якутия)", code:"14")
Region.create( name:"Республика Северная Осетия", code:"15")

Region.create( name:"Республика Татарстан", code:"16")
Region.create( name:"Республика Тува", code:"17")
Region.create( name:"Республика Хакассия", code:"19")
Region.create( name:"Ростовская обл.", code:"61")
Region.create( name:"Рязанская обл.", code:"62")
Region.create( name:"Самарская обл.", code:"63")
Region.create( name:"Саратовская обл.", code:"64")
Region.create( name:"Сахалинская обл.", code:"65")
Region.create( name:"Свердловская обл.", code:"66")
Region.create( name:"Смоленская обл.", code:"67")

Region.create( name:"Ставропольский край", code:"26")
Region.create( name:"Таймырский авт. округ", code:"84")
Region.create( name:"Тамбовская обл.", code:"68")
Region.create( name:"Тверская обл.", code:"69")
Region.create( name:"Томская обл.", code:"70")
Region.create( name:"Тульская обл.", code:"71")
Region.create( name:"Тюменская обл.", code:"72")
Region.create( name:"Удмуртская Республика", code:"18")
Region.create( name:"Ульяновская обл.", code:"73")
Region.create( name:"Усть-Ордынский Бурятский авт. округ", code:"85")

Region.create( name:"Хабаровский край", code:"27")
Region.create( name:"Ханты-Мансийский авт. округ", code:"86")
Region.create( name:"Челябинская обл.", code:"74")
Region.create( name:"Чеченская Республика", code:"20")
Region.create( name:"Читинская обл.", code:"75")
Region.create( name:"Чувашская Республика", code:"21")
Region.create( name:"Чукотский авт. округ", code:"87")
Region.create( name:"Эвенкийский авт. округ", code:"88")
Region.create( name:"Ямало-Ненецкий авт. округ", code:"89")
Region.create( name:"Ярославская обл.", code:"76")