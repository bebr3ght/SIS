spy-uplink-examine-message =
    Вы узнаёте в этом свою [bolditalic]шпионскую аплинк[/bolditalic]
    {"["}color=lime][bolditalic]Щёлкните правой кнопкой[/bolditalic][/color] по нему и выберите «Просмотреть награды», чтобы открыть список наград.
    {"["}color=orange][bolditalic]Щёлкните[/bolditalic][/color] по цели награды с ним в руке, чтобы забрать её.

spy-uplink-open-verb = 🕵 Просмотреть награды
spy-uplink-steal-verb = 🕵 Просканировать цель
spy-uplink-refresh-time = До обновления: {$time}
spy-uplink-title = Шпионский аплинк
spy-uplink-flavor = Награды выдаются в порядке очереди.
spy-uplink-claimed = 🕵 Получено!
spy-uplink-cant-claim = Ваши благодетели считают вас неспособным выполнить это.
spy-uplink-reward = Награда: {$reward}
spy-uplink-description-label = [font size=10][color=darkcyan]{$desc}[/color][/font]
spy-uplink-collect-reward = Забрать награду
spy-uplink-bounties = Награды
spy-uplink-rewards = Награды
spy-uplink-select-reward = Выбрать награду
spy-uplink-no-rewards = Нет доступных наград!
spy-uplink-steal-fail = Ваш аплинк мигает красным: {$target} недействителен для активных незабранных наград или не может быть извлечён отсюда.
spy-uplink-new = 🕵 Создать новый шпионский аплинк

spy-uplink-ammo-name = Боеприпасы
spy-uplink-ammo-desc = Боеприпасы на ваш выбор

spies-title = Шпионы
spies-description = Красный шпион проник на базу.

spy-role-claimed-bounties =
    {CAPITALIZE($name)} has claimed a total of [color=red]{$amount}[/color] bounties.
    {" "}

# SIS-Start
# AUTOGEN-Start
# Вы - шпион.
# Замаскируйтесь под члена их экипажа и украдите жизненно важное оборудование.
# AUTOGEN-End TODO(Update_Locale):
spy-role-greeting =
    Вы - [gradient color1="{$hl1}" color2="{$hl2}" speed="1"]шпион[/gradient].
    Ваша миссия, если вы решите её принять: проникнуть на космическую станцию 14.
    Замаскируйтесь под члена их экипажа и [gradient color1="{$hl1}" color2="{$hl2}" speed="1"]украдите жизненно важное оборудование[/gradient].
    Если вас поймают или убьют, ваш работодатель откажется от каких-либо знаний о ваших действиях.
    Удачи, агент.

spy-role-greeting-desc =
    • [color={$hl1}]Прикрытие:[/color] выдавайте себя за члена экипажа и не привлекайте внимания службы безопасности.
    • [color={$hl1}]Награды:[/color] ваши задания на кражи выдаются через [gradient color1="{$hl1}" color2="{$hl2}" speed="1"]аплинк в КПК[/gradient] — выполняйте их ради награды.
    • [color={$hl1}]Договор:[/color] если вас раскроют, работодатель от всего откажется. [gradient color1="{$hl1}" color2="{$hl2}" speed="1"]Действуйте тихо и не оставляйте свидетелей[/gradient].
# SIS-End

spy-role-briefing-short = Вы - шпион, которому поручено красть различное оборудование станции.

spy-role-uplink-pda-short =
    Ваш аплинк наград находится в вашем КПК.
    Помните: если вы его потеряете, любой КПК можно превратить в шпионский аплинк.

spy-role-no-uplink-short =
    У вас нет аплинка.
    Найдите любой КПК и вручную превратите его в шпионский аплинк.

spy-bounty-default-name = Кража: {CAPITALIZE($item)}
spy-bounty-default-desc = Украдите любой предмет: {$item}.

spy-bounty-specific-desc = Украдите {$item}.

spy-bounty-area-desc =
    Украдите {$item}, найденный в {$areas}.
    Похожие цели за пределами указанной области не засчитываются.

spy-bounty-organ-name = Кража {CAPITALIZE($organ)} у {CAPITALIZE($uid)}
spy-bounty-organ-desc = Просканируйте {CAPITALIZE($uid)}, {$job}, чтобы украсть их {$organ}.
