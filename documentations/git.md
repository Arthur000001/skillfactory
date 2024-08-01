# Руководство по Git

## Введение

Git — это система контроля версий с открытым исходным кодом, созданная Линусом Торвальдсом в 2005 году. Git предназначен для отслеживания изменений в исходном коде во время разработки программного обеспечения. Он позволяет координировать работу между разработчиками, управлять версиями кода и обеспечивать резервное копирование и восстановление.

## Основные команды Git

### 1. Настройка Git

Перед началом работы с Git настройте своё имя пользователя и адрес электронной почты:

```sh
git config --global user.name "Ваше Имя"
git config --global user.email "ваш.email@example.com"
```

Проверка текущих настроек:

```sh
git config --list
```

### 2. Создание и клонирование репозитория

#### Создание нового репозитория:

Для создания нового репозитория в текущей директории:

```sh
git init
```

Для создания нового репозитория в указанной директории:

```sh
git init имя_директории
```

#### Клонирование существующего репозитория:

```sh
git clone <url>
```

Опционально можно указать название директории:

```sh
git clone <url> имя_директории
```

### 3. Индексация и фиксация изменений

#### Проверка состояния репозитория:

Команда показывает состояние рабочего каталога и индекс (staging area):

```sh
git status
```

#### Добавление изменений в индекс:

Добавление одного файла:

```sh
git add <файл>
```

Добавление всех изменений:

```sh
git add .
```

#### Просмотр изменений перед фиксацией:

Для просмотра изменений, которые были добавлены в индекс:

```sh
git diff --staged
```

#### Фиксация изменений:

С фиксацией можно добавить описание изменений:

```sh
git commit -m "Сообщение коммита"
```

Фиксация с открытием редактора для ввода сообщения:

```sh
git commit
```

#### Отмена индексации:

Для удаления файлов из индекса:

```sh
git reset HEAD <файл>
```

### 4. Ветки

Ветки позволяют работать над разными функциями или исправлениями параллельно. Основная ветка обычно называется `main` или `master`.

#### Создание новой ветки:

```sh
git branch <имя_ветки>
```

#### Переключение между ветками:

```sh
git checkout <имя_ветки>
```

#### Создание и переключение на новую ветку:

```sh
git checkout -b <имя_ветки>
```

#### Просмотр всех веток:

```sh
git branch
```

#### Удаление ветки:

Удаление локальной ветки:

```sh
git branch -d <имя_ветки>
```

Удаление удаленной ветки:

```sh
git push origin --delete <имя_ветки>
```

### 5. Слияние и ребейз

#### Слияние веток:

Для слияния ветки с текущей:

```sh
git merge <имя_ветки>
```

#### Ребейз ветки:

Для переноса изменений из одной ветки в другую:

```sh
git rebase <ветка-источник>
```

### 6. Удаленные репозитории

Удаленные репозитории позволяют хранить проект на сервере и делиться им с другими разработчиками.

#### Добавление удаленного репозитория:

```sh
git remote add origin <url>
```

#### Просмотр удаленных репозиториев:

```sh
git remote -v
```

#### Переименование удаленного репозитория:

```sh
git remote rename <старое_имя> <новое_имя>
```

#### Удаление удаленного репозитория:

```sh
git remote remove <имя>
```

#### Отправка изменений в удаленный репозиторий:

Для отправки изменений в удаленный репозиторий:

```sh
git push origin <ветка>
```

#### Получение изменений из удаленного репозитория:

Для получения и слияния изменений из удаленного репозитория:

```sh
git pull
```

### 7. Восстановление изменений

#### Просмотр истории коммитов:

```sh
git log
```

#### Просмотр истории с различиями:

```sh
git log -p
```

#### Просмотр изменений перед фиксацией:

```sh
git diff
```

#### Восстановление файлов в рабочем каталоге:

Для восстановления измененного файла из индекса или последнего коммита:

```sh
git checkout -- <файл>
```

#### Восстановление коммита:

Для отмены последнего коммита:

```sh
git reset --soft HEAD~1
```

Для удаления изменений в последнем коммите:

```sh
git reset --hard HEAD~1
```

### 8. Теги

Теги используются для создания меток на коммитах, часто для релизов.

#### Создание тега:

```sh
git tag <имя_тега>
```

#### Просмотр тегов:

```sh
git tag
```

#### Удаление тега:

```sh
git tag -d <имя_тега>
```

### Полезные советы

- **Частые коммиты**: Делайте частые и осмысленные коммиты с понятными сообщениями.
- **Использование `.gitignore`**: Файл `.gitignore` помогает исключить из репозитория файлы и папки, которые не должны быть отслеживаемы.
- **Резервные копии**: Регулярно отправляйте изменения в удаленный репозиторий для создания резервных копий.
- **Изучение истории**: Используйте `git log` и `git diff` для изучения истории изменений и отслеживания проблем.

## Заключение

Git является мощным инструментом для управления версиями кода. Он позволяет легко управлять и отслеживать изменения в проектах, а также сотрудничать с другими разработчиками. Использование Git и следование лучшим практикам помогает сделать разработку более эффективной и организованной.