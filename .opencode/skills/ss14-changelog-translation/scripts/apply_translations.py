#!/usr/bin/env python3
"""Точечно заменяет message в записях ченджлога по их id.

Сохраняет заголовок файла (Name/Order/AdminOnly/Entries/BOM), порядок ключей,
однострочные и блочные скаляры. Правки адресуются по id записи, а не по тексту
message, поэтому дубликаты сообщений безопасны.

Использование:
    python3 apply_translations.py <file> <translations.json>

JSON: объект {"<id>": ["перевод 1", "перевод 2", ...]}. Число переводов в
списке должно совпадать с числом changes у записи (иначе предупреждение).
"""

import json
import re
import sys

from _lib import entry_bounds, read_lines, yaml_plain


def main():
    if len(sys.argv) != 3:
        print(__doc__)
        return 2
    path, jpath = sys.argv[1], sys.argv[2]
    with open(jpath, encoding="utf-8") as f:
        translations = {int(k): v for k, v in json.load(f).items()}

    lines = read_lines(path)
    bounds = entry_bounds(lines)
    out = []
    used_ids = set()
    had_warning = False

    for si in range(len(bounds) - 1):
        a, b = bounds[si], bounds[si + 1]
        block = lines[a:b]
        if not block or not block[0].startswith("- author:"):
            out.extend(block)
            continue

        idm = None
        for l in block:
            m = re.match(r"^  id: (\d+)\s*$", l)
            if m:
                idm = int(m.group(1))
                break
        if idm is None or idm not in translations:
            out.extend(block)
            continue

        used_ids.add(idm)
        trans = translations[idm]
        ti = 0
        i = 0
        while i < len(block):
            l = block[i]
            m = re.match(r"^(    message:)(\s*)(.*)$", l)
            if m:
                val = m.group(3)
                if ti >= len(trans):
                    print(
                        f"ПРЕДУПРЕЖДЕНИЕ: {path} id={idm}: лишнее message "
                        f"(строка {a + i + 1})",
                        file=sys.stderr,
                    )
                    had_warning = True
                    out.append(l)
                    i += 1
                    continue
                t = trans[ti]
                ti += 1
                if val[:1] in (">", "|"):
                    j = i + 1
                    while j < len(block) and (
                        block[j].startswith("      ") or block[j].strip() == ""
                    ):
                        j += 1
                    out.append("    message: " + val)
                    out.append("      " + t)
                    i = j
                    continue
                out.append("    message: " + yaml_plain(t))
                i += 1
                continue
            out.append(l)
            i += 1

        if ti != len(trans):
            print(
                f"ПРЕДУПРЕЖДЕНИЕ: {path} id={idm}: использовано {ti} переводов "
                f"из {len(trans)}",
                file=sys.stderr,
            )
            had_warning = True

    missing = set(translations) - used_ids
    if missing:
        print(
            f"ПРЕДУПРЕЖДЕНИЕ: {path}: id не найдены: {sorted(missing)}",
            file=sys.stderr,
        )
        had_warning = True

    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(out))
    print(f"Готово: {path} (записей изменено: {len(used_ids)})")
    return 1 if had_warning else 0


if __name__ == "__main__":
    sys.exit(main())
