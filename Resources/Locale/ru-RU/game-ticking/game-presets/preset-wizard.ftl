## Survivor

roles-antag-survivor-name = Выживший
# It's a Halo reference
roles-antag-survivor-objective = Текущая задача: Выжить

survivor-role-greeting =
    Вы - выживший.
    Ваша главная задача остаться в живых и вернуться на ЦК.
    Накопите столько огневой мощи, сколько необходимо для гарантии вашего выживания.
    Никому не доверяйте.

survivor-round-end-dead-count =
    { $deadCount ->
        [one] [color=red]{ $deadCount }[/color] выживший умер.
       *[other] [color=red]{ $deadCount }[/color] выживших умерло.
    }

survivor-round-end-alive-count =
    { $aliveCount ->
        [one] [color=yellow]{ $aliveCount }[/color] выживший остался на станции.
       *[other] [color=yellow]{ $aliveCount }[/color] выживших осталось на станции.
    }

survivor-round-end-alive-on-shuttle-count =
    { $aliveCount ->
        [one] [color=green]{ $aliveCount }[/color] выживший выбрался живым.
       *[other] [color=green]{ $aliveCount }[/color] выживших выбралось живыми.
    }

## Wizard

objective-issuer-swf = [color=turquoise]Федерация космических волшебников[/color]

wizard-title = Волшебник
wizard-description = На станции волшебник! Никогда не знаешь, что он может выкинуть.

roles-antag-wizard-name = Волшебник
roles-antag-wizard-objective = Преподайте им урок, который они никогда не забудут.

# SIS-Start
wizard-role-greeting =
    {"["}gradient angle="45" color1="{$hl1}" color2="{$hl2}" speed="1"]Время магии, ублюдки![/gradient]
    Отношения между [color={$hl1}]Федерацией Космических Магов[/color] и [color={$hl1}]NanoTrasen[/color] накалились до предела.

    Совет поручил именно вам нанести визит на станцию [color={$hl1}]{$station}[/color], дабы напомнить этим бюрократам, почему с чародеями шутки плохи.

    {"["}gradient color1="{$hl1}" color2="{$hl2}" speed="1.2"]Сейте чистый астральный хаос и разрушение.[/gradient]

wizard-role-greeting-desc =
    • [color={$hl1}]Гримуар заклинаний:[/color] волшебная книга в ваших руках. Изучайте разрушительные чары, метайте молнии и искривляйте пространство.
    • [color={$hl1}]Свобода хаоса:[/color] обратите станцию в пепелище или устройте безумный цирк — ваш арсенал ограничен лишь запасом маны и фантазией.
    • [color={$hl1}]Главный наказ:[/color] Совет ожидает вашего триумфального возвращения. Разнесите этот сектор, но [gradient color1="{$hl1}" color2="{$hl2}" speed="1"]вернитесь назад живым[/gradient]!
# SIS-End

wizard-round-end-name = волшебник

## TODO: Wizard Apprentice (Coming sometime post-wizard release)
