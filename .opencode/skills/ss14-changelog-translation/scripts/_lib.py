"""Общие утилиты для скриптов перевода ченджлогов SS14."""

import re

import yaml

PULL_RE = re.compile(r"/pull/(\d+)")


def load_entries(path):
    with open(path, encoding="utf-8") as f:
        data = yaml.safe_load(f)
    if isinstance(data, dict):
        return data, data.get("Entries", [])
    return data, data


def pr_of(entry):
    if not isinstance(entry, dict):
        return None
    m = PULL_RE.search(entry.get("url", "") or "")
    return int(m.group(1)) if m else None


def find_span(entries, frm, to):
    """Индексы первой записи с PR=frm и последней с PR=to в порядке файла."""
    first = last = None
    for i, e in enumerate(entries):
        n = pr_of(e)
        if n is None:
            continue
        if n == frm and first is None:
            first = i
        if n == to:
            last = i
    return first, last


def read_lines(path):
    with open(path, encoding="utf-8") as f:
        return f.read().split("\n")


def entry_bounds(lines):
    """Границы блоков: [0]..[первый author] — заголовок, затем записи."""
    starts = [i for i, l in enumerate(lines) if l.startswith("- author:")]
    return [0] + starts + [len(lines)]


def yaml_plain(s):
    if s == "":
        return "''"
    if s[0] in "-?:,[]{}#&*!|>'\"%@`" or ": " in s or " #" in s:
        return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'
    return s
