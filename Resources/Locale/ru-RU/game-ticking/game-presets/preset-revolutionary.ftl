# SPDX-FileCopyrightText: 2023 DrSmugleaf <DrSmugleaf@users.noreply.github.com>
# SPDX-FileCopyrightText: 2023 Vasilis <vasilis@pikachu.systems>
# SPDX-FileCopyrightText: 2023 coolmankid12345 <55817627+coolmankid12345@users.noreply.github.com>
# SPDX-FileCopyrightText: 2023 coolmankid12345 <coolmankid12345@users.noreply.github.com>
# SPDX-FileCopyrightText: 2023 deltanedas <@deltanedas:kde.org>
# SPDX-FileCopyrightText: 2024 BombasterDS <115770678+BombasterDS@users.noreply.github.com>
# SPDX-FileCopyrightText: 2024 Killerqu00 <47712032+Killerqu00@users.noreply.github.com>
# SPDX-FileCopyrightText: 2024 Mr. 27 <45323883+Dutch-VanDerLinde@users.noreply.github.com>
# SPDX-FileCopyrightText: 2024 deltanedas <39013340+deltanedas@users.noreply.github.com>
# SPDX-FileCopyrightText: 2025 Aiden <28298836+Aidenkrz@users.noreply.github.com>
# SPDX-FileCopyrightText: 2025 Aiden <aiden@djkraz.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

## Rev Head

roles-antag-rev-head-name = Глава революции
roles-antag-rev-head-objective = Ваша задача - захватить станцию, склонив членов экипажа на свою сторону, и уничтожив весь командный состав станции.

## Trauma - rewrote

# SIS-Start
# AUTOGEN-Start
# Вы - глава революции.
# Вам поручено устранить весь командный состав станции путём конверсии, убийства, или ареста.
# Синдикат проспонсировал вас особой вспышкой, которая конвертирует членов экипажа на вашу сторону.
# Осторожно, она не сработает на тех, у кого есть имплант "Щит Разума", и тех, кто носит защиту для глаз.
# Viva la revolución!
# AUTOGEN-End TODO(Update_Locale):
head-rev-role-greeting =
    Вы [color={$hl1}]Глава Революции[/color]!
    Ваша главная цель: свергнуть тиранию [color={$hl1}]NanoTrasen[/color] и [color={$hl1}]устранить весь командный состав[/color] станции любыми средствами.

head-rev-role-greeting-desc =
    • [color={$hl1}]Вербуйте сторонников:[/color] используйте своё снаряжение, чтобы обращать членов экипажа на сторону восстания.
    • [color={$hl1}]Ограничения:[/color] обращение не сработает на тех, кто носит [color={$hl1}]защиту для глаз[/color] (очки/маски) или имеет имплант [color={$hl1}]«Щит Разума»[/color].
    • [color={$hl1}]Берегите лидеров:[/color] если все Главы Революции погибнут - восстание будет подавлено, а все обращенные вернутся к обычной работе.

    {"["}color={$hl1}]Viva la revolución![/color]
# SIS-End

## Trauma - rewrote
head-rev-briefing =
    Используйте вспышки, чтобы конвертировать членов экипажа на свою сторону.
    Избавьтесь от всех глав, чтобы захватить станцию.

head-rev-break-mindshield = Щит разума был уничтожен!

## Rev

roles-antag-rev-name = Революционер
roles-antag-rev-objective = Ваша задача - защищать и выполнять приказы глав революции, а также избавиться от всего командного состава станции или конвертировать его.

rev-break-control =
    { $name } { GENDER($name) ->
        [male] вспомнил, кому он верен
        [female] вспомнила, кому она верна
        [epicene] вспомнили, кому они верни
       *[neuter] вспомнило, кому оно верно
    } на самом деле!

# SIS-Start
# AUTOGEN-Start
# Вы - Революционер.
# Вам поручено захватить станцию и защищать глав революции.
# Избавьтесь от всего командного состава станции или конвертируйте его.
# Viva la revolución!
# AUTOGEN-End TODO(Update_Locale):
rev-role-greeting =
    Вы [color={$hl1}]Революционер[/color].
    Вам поручено защищать [color={$hl1}]Глав Революции[/color] и помочь им захватить станцию.
    Действуйте сообща, чтобы устранить или обратить [color={$hl1}]весь командный состав[/color]!

rev-role-greeting-desc =
    • [color={$hl1}]Деконвертация:[/color] остерегайтесь поимки службой безопасности, в вас могут подавить революционные идеи путём установки [color={$hl1}]«Щита Разума»[/color].
    • [color={$hl1}]Берегите лидеров:[/color] если все Главы Революции погибнут - восстание будет подавлено, а все обращенные вернутся к обычной работе.

    {"["}color={$hl1}]Viva la revolución![/color]
# SIS-End

rev-briefing = Помогите главам революции избавиться от командования станции, чтобы захватить её.

## General

rev-title = Революционеры
rev-description = Революционеры среди нас.

rev-not-enough-ready-players = Недостаточно игроков готовы к игре! { $readyPlayersCount } игроков из необходимых { $minimumPlayers } готовы. Нельзя запустить пресет Революционеры.
rev-no-one-ready = Нет готовых игроков! Нельзя запустить пресет Революционеры.
rev-no-heads = Нет кандидатов на роль главы революции. Нельзя запустить пресет Революционеры.

rev-won = Главы революции выжили и уничтожили весь командный состав станции.

rev-lost = Члены командного состава станции выжили и уничтожили всех глав революции.

rev-stalemate = Главы революции и командный состав станции погибли. Это ничья.

rev-reverse-stalemate = Главы революции и командный состав станции выжили.

rev-headrev-count =
    { $initialCount ->
        [one] Глава революции был один:
       *[other] Глав революции было { $initialCount }:
    }

rev-headrev-name-user = [color=#5e9cff]{ $name }[/color] ([color=gray]{ $username }[/color]) конвертировал { $count } { $count ->
        [one] члена
        [few] члена
       *[other] членов
    } экипажа

rev-headrev-name = [color=#5e9cff]{ $name }[/color] конвертировал { $count } { $count ->
        [one] члена
        [few] члена
       *[other] членов
    } экипажа

## Deconverted window

rev-deconverted-title = Разконвертированы!
rev-deconverted-text =
    Со смертью последнего главы революции, революция оканчивается.
    
    Вы больше не революционер, так что ведите себя хорошо.
rev-deconverted-confirm = Подтвердить
