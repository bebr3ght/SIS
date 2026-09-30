# SPDX-FileCopyrightText: 2025 Aiden <28298836+Aidenkrz@users.noreply.github.com>
# SPDX-FileCopyrightText: 2025 Aiden <aiden@djkraz.com>
# SPDX-FileCopyrightText: 2025 Ilya246 <57039557+Ilya246@users.noreply.github.com>
# SPDX-FileCopyrightText: 2025 Piras314 <p1r4s@proton.me>
# SPDX-FileCopyrightText: 2025 Theodore Lukin <66275205+pheenty@users.noreply.github.com>
# SPDX-FileCopyrightText: 2025 gluesniffler <159397573+gluesniffler@users.noreply.github.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

abductors-ui-beacons = Маяки
abductors-ui-teleport = Телепорт
abductors-ui-attract = Притяжение

abductors-ui-experiment = Эксперимент
abductors-ui-complete-experiment = Завершить эксперимент

abductors-ui-gizmo-transferred = Информация о цели передана

abductors-ui-armor-control = Управление бронёй
abductors-ui-combat-mode = Боевой режим
abductors-ui-stealth-mode = Режим скрытности
abductors-ui-lock-armor = Заблокировать броню
abductors-ui-unlock-armor = Разблокировать броню
abductors-ui-vest-linked = Жилет подключён

abductors-title = Абдукторы
abductors-description = Абдукторы нацелились на станцию. Избегайте похищения!

abductor-lone-ghost-role-name = Одинокий абдуктор
abductor-lone-ghost-role-desc = Похищайте людей, и в одиночку заполняйте их экспериментальными органами сомнительного происхождения.

abductor-scientist-ghost-role-name = Учёный-абдуктор
abductor-scientist-ghost-role-desc = Телепортируйте людей, похищенными вашим напарником, на свой корабль, и заполняйте их экспериментальными органами сомнительного происхождения.

abductor-agent-ghost-role-name = Агент-абдуктор
abductor-agent-ghost-role-desc = Похищайте людей, чтобы ваш напарник заполнил их экспериментальными органами сомнительного происхождения.

abductors-ghost-role-rules = Вы — [color=red][bold]Абдуктор[/bold][/color].
                            Ваша цель — похищать людей со станции и заменять их органы на различные экспериментальные устройства,
                            после чего возвращать их обратно. Вам запрещено уничтожать станцию или намеренно убивать людей.
                            Вам выгодно вернуть испытуемых живыми и здоровыми ради чистоты эксперимента.

                            Вы не помните ничего из своей прошлой жизни, и не помните ничего, что могли увидеть в виде призрака.
                            Вам разрешено помнить общие знания об игре. Например, как готовить, использовать предметы и т.п.
                            Вам категорически [color=red]ЗАПРЕЩЕНО[/color] помнить имя, внешний вид, и прочее своего прошлого персонажа.

abductor-round-end-agent-name = абдуктор

objective-issuer-abductors = [color=#FD0098]Материнский корабль[/color]

objective-condition-abduct-title = Выполнить {$count} экспериментов
objective-condition-abduct-description = Вам нужно выполнить эксперименты на землянине, используя ваш стол для экспериментов. Засчитывается каждый выполненный этап.

# SIS-Start
abductor-role-greeting =
    {"["}gradient angle="135" spread="35" color1="{$hl1}" color2="{$hl2}" speed="1.8"]Вы Абдуктор, ведущий исследователь высшей цивилизации.[/gradient]
    Примитивные земляне послужат материалом для великих открытий. Ваша задача: [gradient angle="45" spread="60" color1="{$hl1}" color2="{$hl2}" speed="1.2"]похищать людей[/gradient], заменять их органы на экспериментальные устройства и возвращать живыми.

abductor-role-greeting-desc =
    • [color={$hl1}]Чистота эксперимента:[/color] не убивайте людей намеренно и не разрушайте станцию — [color={$hl1}]мёртвые испытуемые бесполезны[/color] для науки!
    • [color={$hl1}]Операционная:[/color] используйте стол для экспериментов на корабле, чтобы вживлять аномальные органы. Засчитывается каждый завершённый этап.
    • [color={$hl1}]Командная работа:[/color] Агент усыпляет жертв на станции и передаёт данные, а Учёный управляет консолями и телепортом.
    • [color={$hl1}]Разум Пришельцев:[/color] используйте [color={$hl1}]+a[/color] или [color={$hl1}]+[/color] в чате для связи с напарником.
# SIS-End

roles-antag-abductor-objective = Похищайте экипаж станции и проводите над ними эксперименты!

# SIS-Start
abductor-victim-role-greeting =
    {"["}gradient angle="60" spread="40" color1="{$hl1}" color2="{$hl2}" speed="2.2"]Они существуют... Они были здесь.[/gradient]
    Вас похитили серые гуманоиды с летающей тарелки и провели над вами нечестивые вивисекции. Внутри вашего тела [gradient angle="90" spread="50" color1="{$hl1}" color2="{$hl2}" speed="1.5"]что-то неестественно пульсирует...[/gradient]

abductor-victim-role-greeting-desc =
    • [color={$hl1}]Шок и Паранойя:[/color] вы свободный антагонист. Ваши прежние убеждения разрушены контактом третьей степени.
    • [color={$hl1}]Голоса в голове:[/color] выполняйте странные задачи из меню персонажа ([color={$hl1}]C[/color] / [color={$hl1}]F1[/color]), которые шепчут вам Голоса.
    • [color={$hl1}]Инопланетные органы:[/color] пришельцы зашили внутрь вас экспериментальный орган — используйте его новые странные свойства!
# SIS-End

abductor-victim-role-name = Похищенный абдукторами
abductor-victim-role-name-freeagent = Похищенный абдукторами (свободный антагонист)
abductor-victim-role-desc = Вы видели то, чего не должны были увидеть. Мир должен узнать правду!

objective-issuer-voices = [color=#FD0098]Голоса[/color]
abductor-ui-pad-found = планшет: [color=green]подключён[/color]
abductor-ui-pad-not-found = планшет: [color=red]не найден[/color]
abductor-ui-target-none = цель: [color=red]НЕТ[/color]
abductor-ui-target-found = цель: [color=green]{$target}[/color]
abductor-ui-experimentator-connected = экспериментатор: [color=green]подключён[/color]
abductor-ui-experimentator-not-found = экспериментатор: [color=red]не найден[/color]
abductor-ui-victim-none = жертва: [color=red]ОТСУТСТВУЕТ[/color]
abductor-ui-victim-found = жертва: [color=green]{$victim}[/color]
abductor-ui-armor-plug-in = [color=red][font size=16]Тебе нужно подключить броню захватчика![/font][/color]
