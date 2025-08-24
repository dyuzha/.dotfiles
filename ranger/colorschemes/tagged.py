from ranger.gui.color import *
from ranger.colorschemes.default import Default

class Scheme(Default):  # Наследуемся от стандартной схемы
    def __init__(self):
        super().__init__()

        # Базовые настройки (можно оставить как в Default)
        self.use_color = True
        self.progress_bar_color = 33  # Цвет прогресс-бара (желтый)

        # Цвета тегов: ("цвет_текста", "цвет_фона", "атрибуты")
        self.tag_colors = {
            # Стандартные теги
            "важный": ("white", "red", "bold"),
            "работа": ("black", "yellow", "underline"),
            "архив": ("white", "darkblue", "normal"),
            "tmp": ("black", "green", "normal"),

            # Однобуквенные теги (если используете "a, "b и т.д.)
            "a": ("white", "magenta", "bold"),
            "r": ("black", "cyan", "normal"),
            "d": ("black", "#ff0000", "normal"),
        }

        # Дополнительные цветовые настройки (опционально)
        self.colors = {
            # ... другие элементы интерфейса ...
        }

    def apply(self, context):
        fg, bg, attr = super().apply(context)

        # Подсветка тегов в списке файлов
        if context.__class__.__name__ == "FileItem" and context.tagged:
            for tag in context.tags:
                if tag in self.tag_colors:
                    fg, bg, attr = self.tag_colors[tag]
                    break

        return fg, bg, attr
