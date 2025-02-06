#!/bin/bash
# set -x

# Проверяем, существует ли переменная XDG_CONFIG_HOME
if [ ! -v "$XDG_CONFIG_HOME" ]; then
  XDG_CONFIG_HOME="$HOME/.config"
  echo "XDG_CONFIG_HOME=$XDG_CONFIG_HOME"
fi

# Проверяем, существует ли директория XDG_CONFIG_HOME, и при отсутствии создаем ее
if [ ! -d "$XDG_CONFIG_HOME" ]; then
  mkdir "$XDG_CONFIG_HOME"
  echo "Создана папка $XDG_CONFIG_HOME"
fi

# Определяем путь до dotfiles
DOTFILES_PATH="$HOME/.dotfiles"

declare -A configs

# Закомментируем ненужные конфиги
# configs[".zshenv"]="$HOME"
# configs["zsh"]="$XDG_CONFIG_HOME"
# configs[".bashrc"]="$HOME"
# configs["nvim"]="$XDG_CONFIG_HOME"
# configs["sway"]="$XDG_CONFIG_HOME"
# configs["waybar"]="$XDG_CONFIG_HOME"
# configs["ranger"]="$XDG_CONFIG_HOME"
# configs["kitty"]="$XDG_CONFIG_HOME"
# configs["zathura"]="$XDG_CONFIG_HOME"
# configs["wofi"]="$XDG_CONFIG_HOME"
# configs["lazygit"]="$XDG_CONFIG_HOME"

# Создаем символические ссылки
for file in "${!configs[@]}"
do
  src="${DOTFILES_PATH}/${file}"
  dst="${configs[$file]}/$file"

  ln -sf "$src" "$dst"
  echo "Создана символическая ссылка для $src в $dst"
done

# Выводим сообщение об успешной установке
echo "Установка .dotfiles завершена успешно!"
