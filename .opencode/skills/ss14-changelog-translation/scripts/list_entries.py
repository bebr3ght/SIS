#!/usr/bin/env python3
"""Печатает непрерывный участок ченджлога между PR from и PR to.

Записи в ченджлоге упорядочены по времени, а не по номеру PR, поэтому между
записями with PR=from и PR=to могут вклиниваться записи с другими PR. Скрипт
показывает ВЕСЬ непрерывный участок, включая такие вклинившиеся записи.

Использование:
    python3 list_entries.py <file> <from> <to>
"""

import sys

from _lib import entry_bounds, find_span, load_entries, pr_of, read_lines


def main():
    if len(sys.argv) != 4:
        print(__doc__)
        return 2
    path, frm, to = sys.argv[1], int(sys.argv[2]), int(sys.argv[3])

    _, entries = load_entries(path)
    first, last = find_span(entries, frm, to)
    if first is None or last is None:
        print(f"ОШИБКА: PR {frm} или PR {to} не найдены в {path}", file=sys.stderr)
        return 1
    if first > last:
        first, last = last, first

    lines = read_lines(path)
    bounds = entry_bounds(lines)
    header = lines[bounds[0]:bounds[1]]
    print(f"# {path}: заголовок = {[l.strip() for l in header if l.strip()]}")
    print(f"# участок: индексы {first}..{last}, записей {last - first + 1}")
    for i in range(first, last + 1):
        e = entries[i]
        pr = pr_of(e)
        msgs = [c.get("message", "") for c in e.get("changes", [])]
        print(f"### idx={i} PR={pr} id={e.get('id')} [{len(msgs)}]")
        # номера строк в файле для этого блока
        a, b = bounds[i], bounds[i + 1]
        print(f"#   lines {a + 1}..{b}")
        for c in e.get("changes", []):
            print(f"  {c.get('type')}|{c.get('message')}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
