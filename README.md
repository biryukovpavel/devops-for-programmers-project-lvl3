### Hexlet tests and linter status:
[![Actions Status](https://github.com/biryukovpavel/devops-for-programmers-project-lvl3/workflows/hexlet-check/badge.svg)](https://github.com/biryukovpavel/devops-for-programmers-project-lvl3/actions)

# Инфраструктура как код

## Оглавление

1. [Введение](#introduction)
1. [Требования](#requirements)
1. [Начало работы](#getting-started)
    - [Скачивание и установка](#download-and-install)
    - [Подготовка инфраструктуры](#prepare-infra)
    - [Деплой приложения](#deploy)
    - [Установка агента мониторинга(DataDog)](#install-monitoring)
1. [Ссылка на задеплоенное приложение](#link)

<a name="introduction"></a>
## Введение

Это приложение позволяет развернуть инфраструктуру в DigitalOcean и задеплоить приложение Redmine при помощи Ansible

<a name="requirements"></a>
## Требования
- Make
- Terraform 1.0.2 или выше
- Ansible 2.9.8 или выше

<a name="getting-started"></a>
## Начало работы

Эта инструкция позволяет вам запустить копию проекта на вашем локальном компьютере в целях разработки и тестирования.

<a name="download-and-install"></a>
### Скачивание и установка

* Клонировать проект
```shell
git clone git@github.com:biryukovpavel/devops-for-programmers-project-lvl3.git
```

* Инициализировать Terraform
```shell
make tf-init
```

* Установить роли и коллекции из Ansible Galaxy
```shell
make galaxy-install
```

* Добавить файл с токеном для доступа к Terraform Cloud API в `./terraform/.terraformrc`

* Добавить файл с токеном для доступа к API DigitalOcean в `./terraform/secret.auto.tfvars`

* Добавить файл с паролем от ansible-vault в `./ansible/tmp/ansible-vault-password`

<a name="prepare-infra"></a>
### Подготовка инфраструктуры

* Развертывание инфраструктуры
```shell
make tf-apply
```

* Установка необходимого ПО на сервера
```shell
make setup-servers
```

<a name="deploy"></a>
### Деплой приложения

Деплой базы данных и приложения на сервера
```shell
make deploy
```

<a name="install-monitoring"></a>
### Установка агента мониторинга(DataDog) на сервера
```shell
make install-monitoring
```

<a name="link"></a>
## Ссылка на задеплоенное приложение
https://devops-for-programmers-prod.club/
