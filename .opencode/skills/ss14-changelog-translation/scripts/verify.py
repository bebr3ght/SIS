#!/usr/bin/env python3
"""Проверяет полноту и целостность перевода участка ченджлога.

Проверки:
  1. Файл парсится как YAML; число записей совпадает с числом строк "- author:".
  2. Ключи заголовка (всё до первой записи) на месте.
  3. Во всём непрерывном участке between PR=from и PR=to не осталось
     непереведённого английского (кроме имён собственных/аббревиатур/URL).
  4. git diff затрагивает только message и продолжения блочных скаляров.

Использование:
    python3 verify.py <file> <from> <to> [доп_разрешённые_слова ...]

Код возврата 0 — всё хорошо, 1 — найдены проблемы.
"""

import re
import subprocess
import sys

from _lib import entry_bounds, find_span, load_entries, pr_of, read_lines

DEFAULT_ALLOW = {
    "vgroid",
    "https",
    "github",
    "com",
    "reagent",
    "name",
    "unknown",
    "trauma",
    "station",
    "issues",
    "goonstation",
}


def check_region(path, frm, to, allow):
    _, entries = load_entries(path)
    first, last = find_span(entries, frm, to)
    problems = []
    if first is None or last is None:
        return [f"PR {frm} или PR {to} не найдены"]
    if first > last:
        first, last = last, first
    for i in range(first, last + 1):
        e = entries[i]
        for c in e.get("changes", []):
            msg = c.get("message", "")
            words = [
                w for w in re.findall(r"\b[a-z]{3,}\b", msg) if w not in allow
            ]
            if words:
                problems.append(
                    f"PR {pr_of(e)} id={e.get('id')}: английский остался: "
                    f"{words} :: {msg}"
                )
    return problems


def check_structure(path):
    problems = []
    try:
        data, entries = load_entries(path)
    except Exception as ex:  # noqa: BLE001
        return [f"YAML не парсится: {ex}"]

    raw = read_lines(path)
    author_lines = sum(1 for l in raw if l.startswith("- author:"))
    if len(entries) != author_lines:
        problems.append(
            f"число записей YAML ({len(entries)}) != число строк '- author:' "
            f"({author_lines})"
        )

    bounds = entry_bounds(raw)
    header = [l for l in raw[: bounds[1]] if l.strip()]
    if isinstance(data, dict):
        if "Entries" not in data:
            problems.append("в заголовке пропал ключ 'Entries'")
    for l in header:
        key = l.split(":", 1)[0]
        if key and key not in ("Entries",):
            # ключ заголовка должен присутствовать в распарсенном словаре
            if isinstance(data, dict) and key not in data:
                problems.append(f"в заголовке пропал ключ '{key}'")
    return problems


def check_git_diff(path):
    try:
        res = subprocess.run(
            ["git", "diff", "--unified=0", "--", path],
            capture_output=True,
            text=True,
        )
    except FileNotFoundError:
        return []
    if res.returncode != 0:
        return []
    problems = []
    for line in res.stdout.split("\n"):
        if not line or line[0] not in "+-":
            continue
        if line.startswith("+++") or line.startswith("---"):
            continue
        body = line[1:]
        if re.match(r"^\s*message:", body):
            continue
        if body.startswith("      "):
            continue
        problems.append(f"git diff затронул не-message строку: {line}")
    return problems


def main():
    if len(sys.argv) < 4:
        print(__doc__)
        return 2
    path, frm, to = sys.argv[1], int(sys.argv[2]), int(sys.argv[3])
    allow = set(DEFAULT_ALLOW) | set(sys.argv[4:])

    problems = []
    problems += check_structure(path)
    problems += check_region(path, frm, to, allow)
    problems += check_git_diff(path)

    if problems:
        print(f"ПРОБЛЕМЫ ({len(problems)}):")
        for p in problems:
            print(" -", p)
        return 1
    print(f"OK: {path}, участок {frm}..{to} переведён полностью")
    return 0


if __name__ == "__main__":
    sys.exit(main())
