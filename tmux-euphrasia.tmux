#!/usr/bin/env bash
# tmux-euphrasia — TPM entrypoint
# Copyright (C) 2026 kyau
# SPDX-License-Identifier: AGPL-3.0-or-later

set -euo pipefail

CURRENT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
tmux source-file "$CURRENT_DIR/euphrasia.conf"
