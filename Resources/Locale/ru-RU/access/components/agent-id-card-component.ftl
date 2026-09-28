# SPDX-FileCopyrightText: 2022 Rane <60792108+Elijahrane@users.noreply.github.com>
# SPDX-FileCopyrightText: 2023 PrPleGoo <PrPleGoo@users.noreply.github.com>
# SPDX-FileCopyrightText: 2025 Aiden <28298836+Aidenkrz@users.noreply.github.com>
# SPDX-FileCopyrightText: 2025 Aiden <aiden@djkraz.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

agent-id-new =
    { CAPITALIZE($card) } { $number ->
        [0] не дала новых доступов
        [one] дала { $number } новый доступ
        [few] дала { $number } новых доступа
       *[other] дала { $number } новых доступов
    }.

agent-id-open-ui-verb = Изменить настройки

agent-id-ui-menu-title = ID-карта агента
agent-id-ui-tab-settings = Настройки
agent-id-ui-tab-job-icons = Значки должностей

agent-id-ui-input-name = Имя:
agent-id-ui-input-job = Должность:

agent-id-ui-os = Nuke#OS ™
agent-id-ui-os-flavor = Если сомневаешься, мима никто не станет допрашивать
# Get your mind out of the gutter.
agent-id-ui-footer-flavor-left = Обычная ID-карта, здесь нечего смотреть
agent-id-ui-footer-flavor-right = v2.0
