## Установить с помощью своего менеджера пакетов
---
```bash
sudo dnf install zsh
```

## Назначить zsh в качестве SHELL по умолчанию
---
```bash
chsh -s $(which zsh)
```

## Базовая конфигурация
---
```bash
mkdir -p ~/.config/zsh
touch ~/.zshenv
```
Переменные окружения в `.zshrc` будут доступны только в терминалле
Для того, чтобы сделать их доступными вне терминала, необходимо их прописать в `~/.zshenv`

## Установка "Плагин-менеджера"
---
```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote

# Настройка плагинов в zsh_plugins.txt

# Перезапуск SHELL
exec -l $SHELL
```




source: [LINUX.ORG.RU - Настраиваем и используем ZSH вместе с BASH...](https://www.linux.org.ru/articles/admin/17665840/page1)
