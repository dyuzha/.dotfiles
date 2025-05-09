# Подключаем общие настройки для shell
for src in ~/.dotfiles/sharerc.d/*.sh; do
  . "$src"
done
