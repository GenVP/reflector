#использовать "../src"
#Использовать asserts
#Использовать logos
#Использовать semver

#Использовать "./fixtures/ТестоваяЛиба"

Перем юТест;
Перем Лог;
Перем ВерсияБольше20;

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт

	юТест = Тестирование;

	ИменаТестов = Новый Массив;

	ИменаТестов.Добавить("ТестДолжен_ПроверитьНаличиеФункции");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьНаличиеПроцедуры");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьНаличиеОбязательнойФункции");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьНаличиеОбязательнойПроцедуры");

	ИменаТестов.Добавить("ТестДолжен_ПроверитьРеализациюИнтерфейса");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьПолучениеРеализованныхМетодовПоИнтерфейсу");

	ИменаТестов.Добавить("ТестДолжен_ПроверитьНаличиеСвойства");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьНеНаличиеСвойства");

	ИменаТестов.Добавить("ТестДолжен_ПроверитьПолучениеТаблицыМетодов");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьПолучениеТаблицаСвойств");

	ИменаТестов.Добавить("ТестДолжен_ПроверитьРаботуВнутреннегоКеша");

	ИменаТестов.Добавить("ТестДолжен_ПолучитьМетодыПоАннотации");

	Возврат ИменаТестов;

КонецФункции

Функция ТестовыйСлучай(Знач Имя, Знач КоличествоПараметров, Знач ЭтоФункция, Знач Результат)
	
	Тест = Новый Структура;
	Тест.Вставить("Имя", Имя);
	Тест.Вставить("КоличествоПараметров", КоличествоПараметров);
	Тест.Вставить("ЭтоФункция", ЭтоФункция);
	Тест.Вставить("Результат", Результат);

	Возврат Тест;
КонецФункции

Процедура ТестДолжен_ПроверитьНаличиеФункции() Экспорт
	
	ТестовыеСлучаи = Новый Массив;
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция1", 0, Истина, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция1", 1, Истина, Ложь));

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция2", 2, Истина, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция2", 3, Истина, Ложь));

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция3", 3, Истина, Ложь));

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция4", 0, Истина, Ложь));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция5", 1, Истина, Ложь));

	Если ВерсияБольше20 Тогда
		ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция3", 1, Истина, Истина));
	КонецЕсли;

	ОбъектПроверки = ПолучитьТестовыйОбъект();
	РасширенныйРефлектор = Новый РефлекторОбъекта(ОбъектПроверки);

	Для каждого Тест Из ТестовыеСлучаи Цикл
		Лог.Отладка("Проверяю тестовый случай: %1", Тест.Имя);
		
		Результат = РасширенныйРефлектор.ЕстьФункция(Тест.Имя, Тест.КоличествоПараметров);

		Утверждения.ПроверитьРавенство(Результат, Тест.Результат, "Результаты должны совпадать");

	КонецЦикла;

	РасширенныйРефлектор = Новый РефлекторОбъекта(Новый ТестовыйКласс);

	Для каждого Тест Из ТестовыеСлучаи Цикл
		Лог.Отладка("Проверяю тестовый случай: %1", Тест.Имя);
		
		Результат = РасширенныйРефлектор.ЕстьФункция(Тест.Имя, Тест.КоличествоПараметров);

		Утверждения.ПроверитьРавенство(Результат, Тест.Результат, "Результаты должны совпадать");

	КонецЦикла;

КонецПроцедуры

Процедура ТестДолжен_ПроверитьНаличиеПроцедуры() Экспорт
	
	ТестовыеСлучаи = Новый Массив;
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура1", 0, Ложь, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура1", 1, Ложь, Ложь));

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура2", 2, Ложь, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура2", 3, Ложь, Ложь));

	// ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура3", 1, Ложь, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура3", 3, Ложь, Ложь));

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура4", 1, Ложь, Ложь));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура5", 3, Ложь, Ложь));

	ОбъектПроверки = ПолучитьТестовыйОбъект();
	РасширенныйРефлектор = Новый РефлекторОбъекта(ОбъектПроверки);

	Для каждого Тест Из ТестовыеСлучаи Цикл
		Лог.Отладка("Проверяю тестовый случай: %1", Тест.Имя);
		
		Результат = РасширенныйРефлектор.ЕстьПроцедура(Тест.Имя, Тест.КоличествоПараметров);

		Утверждения.ПроверитьРавенство(Результат, Тест.Результат, "Результаты должны совпадать");

	КонецЦикла;

	РасширенныйРефлектор = Новый РефлекторОбъекта(Новый ТестовыйКласс);

	Для каждого Тест Из ТестовыеСлучаи Цикл
		Лог.Отладка("Проверяю тестовый случай: %1", Тест.Имя);
		
		Результат = РасширенныйРефлектор.ЕстьПроцедура(Тест.Имя, Тест.КоличествоПараметров);

		Утверждения.ПроверитьРавенство(Результат, Тест.Результат, "Результаты должны совпадать");

	КонецЦикла;

КонецПроцедуры

Процедура ТестДолжен_ПроверитьНаличиеОбязательнойФункции() Экспорт

	ТестовыеСлучаи = Новый Массив;
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция1", 0, Истина, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция1", 1, Истина, Ложь));

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция2", 2, Истина, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция2", 3, Истина, Ложь));

	// ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция3", 1, Истина, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция3", 3, Истина, Ложь));

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция4", 0, Истина, Ложь));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Функция5", 1, Истина, Ложь));


	ОбъектПроверки = ПолучитьТестовыйОбъект();
	РасширенныйРефлектор = Новый РефлекторОбъекта(ОбъектПроверки);

	Для каждого Тест Из ТестовыеСлучаи Цикл
		Лог.Отладка("Проверяю тестовый случай: %1", Тест.Имя);
		
		Результат = Ложь;

		Попытка
			РасширенныйРефлектор.ОбязательнаяФункция(Тест.Имя, Тест.КоличествоПараметров);

			Результат = Истина;
		Исключение
		КонецПопытки;
		
		Утверждения.ПроверитьРавенство(Результат, Тест.Результат, СтрШаблон("Результаты должны совпадать для теста: <%1>, 
		|количество параметров <%2>", Тест.Имя, Тест.КоличествоПараметров));

	КонецЦикла;

	РасширенныйРефлектор = Новый РефлекторОбъекта(Новый ТестовыйКласс);

	Для каждого Тест Из ТестовыеСлучаи Цикл
		Лог.Отладка("Проверяю тестовый случай: %1", Тест.Имя);
		
		Результат = Ложь;

		Попытка
			РасширенныйРефлектор.ОбязательнаяФункция(Тест.Имя, Тест.КоличествоПараметров);
			Результат = Истина;
		Исключение
		КонецПопытки;
		
		Утверждения.ПроверитьРавенство(Результат, Тест.Результат, "Результаты должны совпадать для теста: " + Тест.Имя);

	КонецЦикла;

КонецПроцедуры

Процедура ТестДолжен_ПроверитьНаличиеОбязательнойПроцедуры() Экспорт

	ТестовыеСлучаи = Новый Массив;
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура1", 0, Ложь, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура1", 1, Ложь, Ложь));

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура2", 2, Ложь, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура2", 3, Ложь, Ложь));

	// ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура3", 1, Ложь, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура3", 3, Ложь, Ложь));

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура4", 1, Ложь, Ложь));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("Процедура5", 3, Ложь, Ложь));

	ОбъектПроверки = ПолучитьТестовыйОбъект();
	РасширенныйРефлектор = Новый РефлекторОбъекта(ОбъектПроверки);

	Для каждого Тест Из ТестовыеСлучаи Цикл
		Лог.Отладка("Проверяю тестовый случай: %1", Тест.Имя);
		
		Результат = Ложь;

		Попытка
			РасширенныйРефлектор.ОбязательнаяПроцедура(Тест.Имя, Тест.КоличествоПараметров);
			Результат = Истина;
		Исключение
		КонецПопытки;
		
		Утверждения.ПроверитьРавенство(Результат, Тест.Результат, "Результаты должны совпадать для теста: " + Тест.Имя);

	КонецЦикла;

	РасширенныйРефлектор = Новый РефлекторОбъекта(Новый ТестовыйКласс);

	Для каждого Тест Из ТестовыеСлучаи Цикл
		Лог.Отладка("Проверяю тестовый случай: %1", Тест.Имя);
		
		Результат = Ложь;

		Попытка
			РасширенныйРефлектор.ОбязательнаяПроцедура(Тест.Имя, Тест.КоличествоПараметров);
			Результат = Истина;
		Исключение
		КонецПопытки;
		
		Утверждения.ПроверитьРавенство(Результат, Тест.Результат, "Результаты должны совпадать для теста: " + Тест.Имя);

	КонецЦикла;

КонецПроцедуры

Процедура ТестДолжен_ПроверитьРеализациюИнтерфейса() Экспорт

	Интерфейс = Новый ИнтерфейсОбъекта;
	Интерфейс.Ф("Функция1")
			 .П("Процедура1");


	НеРеализованныйИнтерфейс = Новый ИнтерфейсОбъекта;
	НеРеализованныйИнтерфейс.Ф("ЛиповаяФункция", 2).П("ЛиповаяПроцедура", 3);

	ОбъектПроверки = ПолучитьТестовыйОбъект();
	РасширенныйРефлектор = Новый РефлекторОбъекта(ОбъектПроверки);

	РеализуетИнтерфейс = РасширенныйРефлектор.РеализуетИнтерфейс(Интерфейс);

	Утверждения.ПроверитьИстину(РеализуетИнтерфейс, "Интерфейс реализуется объектом");

	Попытка
		РеализуетИнтерфейс = РасширенныйРефлектор.РеализуетИнтерфейс(НеРеализованныйИнтерфейс, Истина);
	Исключение
		РеализуетИнтерфейс = Ложь;
	КонецПопытки;

	Утверждения.ПроверитьЛожь(РеализуетИнтерфейс, "Интерфейс <НеРеализованныйИнтерфейс> не реализуется объектом");


КонецПроцедуры

Процедура ТестДолжен_ПроверитьПолучениеРеализованныхМетодовПоИнтерфейсу() Экспорт

	Интерфейс = Новый ИнтерфейсОбъекта;
	Интерфейс.Ф("Функция1")
			 .П("Процедура1")
			 .Ф("ЛиповаяФункция", 2)
			 .П("ЛиповаяПроцедура", 3);

	РасширенныйРефлектор = Новый РефлекторОбъекта(Новый ТестовыйКласс);

	РеализованныеМетодыИнтерфейса = РасширенныйРефлектор.РеализованныеМетодыИнтерфейса(Интерфейс);
	
	Утверждения.ПроверитьИстину(РеализованныеМетодыИнтерфейса.Функция1, "Метод <Функция1> интерфейса должен реализовываться объектом");
	Утверждения.ПроверитьИстину(РеализованныеМетодыИнтерфейса.Процедура1, "Метод <Процедура1> интерфейса не должен реализовываться объектом");
	
	Утверждения.ПроверитьЛожь(РеализованныеМетодыИнтерфейса.ЛиповаяФункция, "Метод <ЛиповаяФункция> интерфейса не должен реализовываться объектом");
	Утверждения.ПроверитьЛожь(РеализованныеМетодыИнтерфейса.ЛиповаяПроцедура, "Метод <ЛиповаяПроцедура> интерфейса не должен реализовываться объектом");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьНаличиеСвойства() Экспорт

	РасширенныйРефлектор = Новый РефлекторОбъекта(Новый ТестовыйКласс);

	ЕстьСвойство = РасширенныйРефлектор.ЕстьСвойство("Свойство1");
	
	Утверждения.ПроверитьИстину(ЕстьСвойство, "Свойство <Свойство1> должен реализовываться объектом");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьНеНаличиеСвойства() Экспорт

	РасширенныйРефлектор = Новый РефлекторОбъекта(Новый ТестовыйКласс);

	ЕстьСвойство = РасширенныйРефлектор.ЕстьСвойство("ЛиповоеСвойство1");
	
	Утверждения.ПроверитьЛожь(ЕстьСвойство, "Свойство <ЛиповоеСвойство1> должен реализовываться объектом");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьПолучениеТаблицыМетодов() Экспорт

	ОбъектПроверки = Новый ТестовыйКласс;
	РасширенныйРефлектор = Новый РефлекторОбъекта(ОбъектПроверки);

	ТаблицаМетодов = РасширенныйРефлектор.ПолучитьТаблицуМетодов();

	РефлекторПроверки = Новый Рефлектор;
	ТаблицаМетодовЧерезРефлектор = РефлекторПроверки.ПолучитьТаблицуМетодов(ОбъектПроверки);

	Утверждения.ПроверитьРавенство(ТаблицаМетодов.Количество(), ТаблицаМетодовЧерезРефлектор.Количество(), "Количество методов должно быть равно");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьПолучениеТаблицаСвойств() Экспорт

	ОбъектПроверки = Новый ТестовыйКласс;
	РасширенныйРефлектор = Новый РефлекторОбъекта(ОбъектПроверки);

	ТаблицаСвойств = РасширенныйРефлектор.ПолучитьТаблицуСвойств();

	РефлекторПроверки = Новый Рефлектор;
	ТаблицаСвойствЧерезРефлектор = РефлекторПроверки.ПолучитьТаблицуСвойств(ОбъектПроверки);

	Утверждения.ПроверитьРавенство(ТаблицаСвойств.Количество(), ТаблицаСвойствЧерезРефлектор.Количество(), "Количество методов должно быть равно");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьРаботуВнутреннегоКеша() Экспорт

	ОбъектПроверки = Новый ТестовыйКласс;
	РасширенныйРефлектор = Новый РефлекторОбъекта(ОбъектПроверки);

	РасширенныйРефлектор.ПолучитьТаблицуМетодов();
	РасширенныйРефлектор.УстановитьОбъект(Новый ТестовыйКласс);
	РасширенныйРефлектор.ПолучитьТаблицуМетодов();
	РасширенныйРефлектор.УстановитьОбъект(ПолучитьТестовыйОбъект());
	РасширенныйРефлектор.ПолучитьТаблицуМетодов();
	
	КешТаблиц = РасширенныйРефлектор.ПолучитьКешОбъектов();

	Утверждения.ПроверитьРавенство(КешТаблиц.Количество(), 2, "Количество объектов в кеше должно быть равно");

КонецПроцедуры

Процедура ТестДолжен_ПолучитьМетодыПоАннотации() Экспорт

	ОбъектПроверки = ЗагрузитьСценарий("./tests/fixtures/ТестовыйОбъектСАннотациями.os");
	РасширенныйРефлектор = Новый РефлекторОбъекта(ОбъектПроверки);

	КоличествоМетодов = РасширенныйРефлектор.ПолучитьТаблицуМетодовПоАннотации("Аннотация1").Количество();
	Утверждения.ПроверитьРавенство(КоличествоМетодов, 2, "Аннотация1 должно быть 2");

	КоличествоМетодов = РасширенныйРефлектор.ПолучитьТаблицуМетодовПоАннотации("Аннотация2").Количество();
	Утверждения.ПроверитьРавенство(КоличествоМетодов, 1, "Аннотация2 должно быть 1");

	КоличествоМетодов = РасширенныйРефлектор.ПолучитьТаблицуМетодовПоАннотации("НетТакой").Количество();
	Утверждения.ПроверитьРавенство(КоличествоМетодов, 0, "Такой Аннотации нет");

КонецПроцедуры

Функция ПолучитьТестовыйОбъект()

	Возврат ЗагрузитьСценарий("./tests/fixtures/ТестовыйОбъект.os");

КонецФункции

Лог = Логирование.ПолучитьЛог("oscript.lib.reflector");
//Лог.УстановитьУровень(УровниЛога.Отладка);

Версия20 = Новый Версия("1.0.20");

СИ = Новый СистемнаяИнформация;
ТекущаяВерсия = Новый Версия(СИ.Версия);
ВерсияБольше20 = ТекущаяВерсия.БольшеИлиРавны(Версия20);