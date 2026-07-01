#!/bin/bash
set -euo pipefail

# セッション開始時に「今日の日付」を必ずコンテキストに出す。
# 目的: ファイルの更新日時などから日付を推測して間違えるのを防ぐ。
# 日付の正となる情報源はこの date コマンド（システムクロック）。

TODAY="$(date '+%Y-%m-%d (%A) %Z')"

cat <<JSON
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "【重要・日付の基準】今日の日付は ${TODAY} です。日記の記録・最終更新日・「今日」「昨日」などの判断は必ずこの日付を基準にすること。ファイルの更新日時(mtime)やgitのコミット日時から今日の日付を推測してはいけない。"
  }
}
JSON
