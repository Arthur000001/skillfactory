# Вспомогательная документация для работы с terraform
## Команды:
### Terraform:
#### Базовые:
* terraform init - Инициализация инструкций
* terraform plan - Создание плана инструкций
* terraform aplly - Запуск инструкций
#### Дополнительные:
* terraform fmt - форматирвоание кода
* terraform validate - ваоилация кода команд
* terraform-docs - создание документации (это еще надо скачать с GitHub)

## Эксперименты:
### Большую часть работы можно переложить на вспомогательные инструменты:

> * форматирование кода — [Terraform fmt](https://www.terraform.io/docs/cli/commands/fmt.html) ;
> * валидация кода команд — [Terraform validate](https://www.terraform.io/docs/cli/commands/validate.html);
> * генерации документации — [Terraform-docs](https://github.com/SkillfactoryCoding/DEVOPS-Infrastructure-terraform-docs);
> * проверки на удовлетворение соглашений и конвенций — [tflint](https://github.com/SkillfactoryCoding/DEVOPS-Infrastructure-tflint);
> * сканирование статическими анализаторами кода на уязвимости — [Checkov](https://github.com/SkillfactoryCoding/DEVOPS-Infrasrtucture-checkov).

По возможности отдавайте работу с линтерами в Continuous Integration (CI) (тему CI мы рассмотрим в отдельном модуле немного позже). Если вы ещё не готовы для отношений с CI, то необходимо выполнять проверку на локальном компьютере. Это поможет:

> * следовать конвенциям;
> * снизить порог вхождения для коллег;
> * снизить количество времени для подготовки окружения;
> * снизить человеческий фактор;
> * увеличить скорость деплоя.

Если вы хотите сделать Terraform-код более надежным, безопасным, то  рекомендуем рассмотреть список наиболее популярных и полезных инструментов для работы с Terraform:

> * [pre-commit Terraform](https://github.com/SkillfactoryCoding/DEVOPS-infrastructure-pre-commit-terraform) — это набор [git-хуков](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) (гит позволяет вызывать автоматические действия при различных операциях с гит, например при коммите) для работы с Terraform.
> * [Terrafirma](https://github.com/SkillfactoryCoding/DEVOPS-Infrastructure-terrafirma) — это инструмент статического анализа кода Terraform, который поможет обнаружить возможные проблемы в настройках безопасности.
> * [Tfsec](https://github.com/SkillfactoryCoding/DEVOPS-Infrastructure-tfsec) — использует статический анализ ваших шаблонов Terraform для выявления потенциальных проблем безопасности.
> * [Checkov](https://github.com/SkillfactoryCoding/DEVOPS-Infrasrtucture-checkov) — это статический анализатор кода для популярных облачных провайдеров. Поможет выявить проблемы в безопасности и соблюсти нормативные требования облачных провайдеров.
> * [Terratest](https://github.com/SkillfactoryCoding/DEVOPS-Infrastructure-terratest) — это фреймворк, который помогает вам писать тесты на языке GoLang. Тесты выполняют ваш Terraform-код на облачной платформе в «песочнице», а затем проверяют, что результаты соответствуют ожидаемым.