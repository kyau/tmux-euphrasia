#!/usr/bin/env bash
# Copyright (C) 2026 kyau
# SPDX-License-Identifier: AGPL-3.0-or-later

set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
SOCKET="euphrasia-test-$$"

cleanup() {
  tmux -L "$SOCKET" kill-server 2>/dev/null || true
}
trap cleanup EXIT

tmux -L "$SOCKET" -f /dev/null new-session -d -s euphrasia
tmux -L "$SOCKET" run-shell "$ROOT/tmux-euphrasia.tmux"

assert_option() {
  local option="$1"
  local expected="$2"
  local actual
  actual="$(tmux -L "$SOCKET" show-options -gv "$option")"
  if [[ "$actual" != "$expected" ]]; then
    printf 'Expected %s to be %q, got %q\n' "$option" "$expected" "$actual" >&2
    return 1
  fi
}

assert_option_contains() {
  local option="$1"
  local expected="$2"
  local actual
  actual="$(tmux -L "$SOCKET" show-options -gv "$option")"
  if [[ "$actual" != *"$expected"* ]]; then
    printf 'Expected %s to contain %q, got %q\n' "$option" "$expected" "$actual" >&2
    return 1
  fi
}

assert_option status-position bottom
assert_option status-justify centre
assert_option_contains status-style 'bg=#090c19'
assert_option_contains status-style 'fg=#c0c0c0'
assert_option pane-active-border-style 'fg=#5dce33'
assert_option_contains message-style 'fg=#090c19'
assert_option_contains message-style 'bg=#ff7f00'
assert_option_contains window-status-current-format 'bg=#4dc5dc'
assert_option_contains @euphrasia_info_left 'bg=#9f106f'
assert_option_contains @euphrasia_info_right 'bg=#73488b'

[[ "$(tmux -L "$SOCKET" show-options -gv 'status-format[0]')" == *'@euphrasia_info_left'* ]]
[[ "$(tmux -L "$SOCKET" show-options -gv 'status-format[0]')" == *'@euphrasia_info_right'* ]]

printf 'tmux-euphrasia smoke test passed (tmux %s).\n' "$(tmux -V | awk '{print $2}')"
