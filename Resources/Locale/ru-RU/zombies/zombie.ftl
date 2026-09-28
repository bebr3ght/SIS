# SPDX-FileCopyrightText: 2022 EmoGarbage404 <98561806+EmoGarbage404@users.noreply.github.com>
# SPDX-FileCopyrightText: 2022 Kara <lunarautomaton6@gmail.com>
# SPDX-FileCopyrightText: 2023 Nemanja <98561806+EmoGarbage404@users.noreply.github.com>
# SPDX-FileCopyrightText: 2023 Tom Leys <tom@crump-leys.com>
# SPDX-FileCopyrightText: 2024 Tayrtahn <tayrtahn@gmail.com>
# SPDX-FileCopyrightText: 2024 psykana <36602558+psykana@users.noreply.github.com>
# SPDX-FileCopyrightText: 2025 Aiden <28298836+Aidenkrz@users.noreply.github.com>
# SPDX-FileCopyrightText: 2025 Aiden <aiden@djkraz.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

zombie-transform = { CAPITALIZE($target) } теперь зомби!

# SIS-Start
zombie-role-greeting =
    Ваша смертная плоть погибла, но вы восстали как [color={$hl1}]Зомби[/color]!
    Ваш разум поглощен голодом.
    Ваша цель: [color={$hl1}]охотиться на живых[/color] и заражать их, пополняя ряды орды.

zombie-role-greeting-desc =
    • [color={$hl1}]Координация:[/color] держитесь вместе с другими зомби и защищайте [color={$hl1}]Нулевых Пациентов[/color] — ваших прародителей и лидеров.
    • [color={$hl1}]Заражение:[/color] атакуйте выживших когтями и зубами, разнося вирус по всей станции.
    • [color={$hl1}]Конец человечества:[/color] не дайте экипажу спастись на шаттле и обратите станцию в царство мертвых!
# SIS-End

zombie-generic = зомби
zombie-name-prefix = { $baseName }
zombie-role-desc = Зловещий мертвец.
zombie-role-rules = Вы - [color={ role-type-team-antagonist-color }][bold]{ role-type-team-antagonist-name }[/bold][/color]. Ищите и кусайте живых людей, чтобы заразить их и превратить в зомби. Работайте сообща с другими зомби, чтобы захватить станцию.

zombie-permadeath = В этот раз вы мертвы по-настоящему.

zombification-resistance-coefficient-value = - Шанс [color=violet]заражения[/color] уменьшен на [color=lightblue]{ $value }%[/color].

zombie-roleban-ghosted = Вы стали призраком, так как вам запрещено играть за роль Зомби.
