# SPDX-FileCopyrightText: 2022 Kara <lunarautomaton6@gmail.com>
# SPDX-FileCopyrightText: 2023 Nemanja <98561806+EmoGarbage404@users.noreply.github.com>
# SPDX-FileCopyrightText: 2023 Tom Leys <tom@crump-leys.com>
# SPDX-FileCopyrightText: 2024 Aidenkrz <aiden@djkraz.com>
# SPDX-FileCopyrightText: 2024 IProduceWidgets <107586145+IProduceWidgets@users.noreply.github.com>
# SPDX-FileCopyrightText: 2024 username <113782077+whateverusername0@users.noreply.github.com>
# SPDX-FileCopyrightText: 2025 Aiden <28298836+Aidenkrz@users.noreply.github.com>
# SPDX-FileCopyrightText: 2025 Aiden <aiden@djkraz.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

zombie-title = Зомби
zombie-description = На станции появились ожившие мертвецы! Работайте сообща с другими членами экипажа, чтобы пережить эпидемию и защитить станцию.

zombieteors-title = Зомбитеоры
zombieteors-description = На станции во время катаклизмического метеоритного дождя появились зомби! Работайте вместе с членами экипажа и сделайте всё возможное, чтобы выжить!

zombie-not-enough-ready-players = Недостаточно игроков готовы к игре! { $readyPlayersCount } игроков из необходимых { $minimumPlayers } готовы. Нельзя запустить пресет Зомби.
zombie-no-one-ready = Нет готовых игроков! Нельзя запустить пресет Зомби.

# SIS-Start
zombie-patientzero-role-greeting =
    Вы [gradient color1="{$hl1}" color2="{$hl2}" speed="1"]Нулевой Пациент[/gradient]!
    В вашем теле созревает мутировавший штамм зомби-вируса.
    Ваша цель: [gradient color1="{$hl1}" color2="{$hl2}" speed="1"]захватить станцию[/gradient], обратив весь экипаж в живых мертвецов.

zombie-patientzero-role-greeting-desc =
    • [color={$hl1}]Подготовка:[/color] пока вирус не проявился, вооружитесь, найдите инструменты и изолируйте первую жертву в темном углу.
    • [color={$hl1}]Таймер:[/color] вы обратитесь в зомби после смерти, по истечении времени или нажав кнопку активации в панели действий.
    • [color={$hl1}]Орда:[/color] атакуйте членов экипажа в ближнем бою - каждый павший станет вашим верным соратником!

zombie-patientzero-role-briefing =
    Вы — Нулевой Пациент!
    В вашем теле созревает мутировавший штамм зомби-вируса.
    Ваша цель: захватить станцию, обратив весь экипаж в живых мертвецов.
# SIS-End

zombie-healing = You feel a stirring in your flesh
zombie-infection-warning = Вы чувствуете, как зомби-вирус берёт верх
zombie-infection-underway = Ваша кровь начинает сгущаться

## goob edit
zombie-start-announcement = Подтверждена вспышка биологической угрозы 7 уровня на борту станции. Весь персонал обязан сдержать распространение.
### Over
zombie-alone = Вы чувствуете себя совершенно одиноким.

zombie-shuttle-call = Мы зафиксировали, что зомби захватили станцию. Аварийный шаттл был отправлен для эвакуации оставшегося персонала.

zombie-round-end-initial-count =
    { $initialCount ->
        [one] Единственным нулевым пациентом был:
       *[other] Нулевых пациентов было { $initialCount }, ими были:
    }
zombie-round-end-user-was-initial = - [color=plum]{ $name }[/color] ([color=gray]{ $username }[/color]) был одним из нулевых пациентов.

zombie-round-end-amount-none = [color=green]Все зомби были уничтожены![/color]
zombie-round-end-amount-low = [color=green]Почти все зомби были уничтожены.[/color]
zombie-round-end-amount-medium = [color=yellow]{ $percent }% экипажа были обращены в зомби.[/color]
zombie-round-end-amount-high = [color=crimson]{ $percent }% экипажа были обращены в зомби.[/color]
zombie-round-end-amount-all = [color=darkred]Весь экипаж обратился в зомби![/color]

zombie-round-end-survivor-count =
    { $count ->
        [one] Единственным выжившим стал:
       *[other] Осталось всего { $count } выживших, это:
    }
zombie-round-end-user-was-survivor = - [color=White]{ $name }[/color] ([color=gray]{ $username }[/color]) пережил заражение.

