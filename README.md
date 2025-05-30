# syncore

#### Сервис для планирования встреч и организации командной работы.
- Создание встреч
- Создание групп, управление расписанием и участниками
- Можно подтверждать участие в событие и отслеживать, кто присоединится
- Телеграм бот для напоминаний о встречах и управления ими


### План:
- Регистрация
- Создание встреч
- Создание групп
- tg бот
- Тесты
- CI/CD

### Микросервисы:
- User
- Meeting
- Group
- Tg bot
- postgres



## Оригинальное тз
### Технические требования:
#### Архитектура:
- Приложение должно состоять из нескольких микросервисов. 
- Каждый микросервис выполняет строго ограниченные функции, отвечая за свою часть логики.

#### Контейнеризация и оркестрация:
- Использовать Docker для контейнеризации всех сервисов.
- Реализовать docker-compose файл, который будет поднимать:
  - Все сервисы приложения.
  - Вспомогательную инфраструктуру (например, базы данных, кеш).

#### API-Gateway и маршрутизация:
- Должен быть выделен отдельный сервис api-gateway, который:
  - Выставляет наружу REST API эндпоинты для взаимодействия с вашим сервисом, при этом далее сам ходит по другим сервисам и собирает ответ для пользователя.
  - Принимает весь входящий трафик через Nginx.
- Наружу из Docker-контейнеров должен быть проброшен только один порт, соответствующий порту Nginx.
- Все остальные сервисы должны быть доступны только внутри сети Docker.

#### Отказоустойчивость:
- Применять паттерны отказоустойчивости (например, retry-механизмы, circuit breaker и fallback).
- Особое внимание уделить обработке ошибок и снижению влияния сбоев на пользователя.

#### Кэширование:
- Включить в архитектуру Redis для кэширования данных, где это уместно (например, для временных данных, часто запрашиваемых данных и т.д.).

#### Хранилище данных:
- Выберите PostgreSQL или MongoDB в зависимости от целей вашего приложения.
- Структура базы данных должна быть оптимизирована для задач вашего сервиса.

#### Асинхронное взаимодействие (опционально):
- Использование Kafka для реализации асинхронного взаимодействия между микросервисами приветствуется и принесёт дополнительные баллы.
- Реализуйте продуманное взаимодействие через очереди сообщений, если задача вашего сервиса этого требует.

#### Тестирование:
- Для каждого микросервиса необходимо написать юнит-тесты и, при необходимости, интеграционные тесты.
- Покрытие тестами каждого микросервиса (за исключением api-gateway) должно быть не ниже 30%.
- В случае, если покрытие ниже 30%, процесс CI/CD пайплайна должен завершаться с ошибкой.

#### GitLab CI/CD:
- Настроить GitLab CI/CD пайплайн, который:
  - Собирает Go-приложение.
  - Запускает тесты.
  - Проверяет покрытие тестами и завершает процесс в случае, если покрытие ниже установленного порога.

#### Документация:
- Должна быть в полном объеме с описанием эндпоинтов, архитектуры и ваших решений.

#### На что обратить внимание:
- Уделите внимание логированию и мониторингу. Логи сервисов должны быть читаемыми и информативными.
- В документации опишите используемую архитектуру, применяемые технологии и обоснование ваших решений.
- Код должен быть написан согласно best practices (читаемость, форматирование, использование комментариев).
