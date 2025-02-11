<h1 align="center">Dotfiles</h1>
<div>
	<h4 align="center">
		<a href="#install.sh">Install.sh</a> ·
		<a href="#included">Included</a> ·
		<a href="#future-use">Future use</a>
	</h4>
</div>

### Included
---
- Конфигурационные файлы
- README.md
- install.sh


## Install.sh
---
После клонирования репозитория **рекомендуется**:

1) Раскоментировать нужные строчки в `Install.sh` для создания/замены конфигурационных файлов по указанным путям.

> [!Example] Часть файла `install.sh`
>```bash
# Закомментируем ненужные конфиги
configs[".zshenv"]="$HOME"
configs["zsh"]="$XDG_CONFIG_HOME"
# configs[".bashrc"]="$HOME"
# ...
```

2) При необходимости изменить следующую строчку (путь к дотфайлам)
```bash
# Определяем путь до dotfiles
DOTFILES_PATH="$HOME/.dotfiles"
```

3) Запустить скрипт
```
/bin/bash -c ./install.sh
```

## Дальнейшее использование
---

*Команды Git выполняются внутри проекта, который был инициализирован, в папке `.git`.*

Стандартная логика работы в Git предполагает, что рабочее дерево проекта находится в этомже каталоге. Поэтому, для синхронизации файлов, надо каждый раз заходить внутрь *dotfiles*

Создание *alias* решает эту проблему.

### Создание alias'а
---
```bash
# Создаем алиас
alias cfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Сохраняем его в настройках среды, чтобы не создавать каждый раз
echo "alias cfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/dotfiles/.share_shellrc

# Отключаем показ неотслеживаемых файлов
cfg config --local status.showUntrackedFiles no
```

### Использование созданного alias'а
---
Теперь взаимодействовать с удаленным репозиторием может происходить по следующему сценариям:


1) Добавление нового конфига в репозиторий
```bash
mv .new_config ~/path/to/dotfiles
ln -sf ~/path/to/dotfiles/.new_config .new_config
    # -s - Создать символический файл
    # -f - Перезаписать существующий файл

# Добавление изменений в репозиторий
cfg add .vimrc
cfg commit -m 'Add vimrc config'
cfg push
```


2) Внесение изменений в конфига в репозиторий
```bash
# Какие-то действия по изменению конфига
#...

# Добавление изменений в репозиторий
cfg add ./modificated_config
cfg commit -m 'edit modificated_config'
cfg push
```
