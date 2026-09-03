# tmux-euphrasia

[https://kyaulabs.com](https://kyaulabs.com)

[![CI](https://github.com/kyaulabs/tmux-euphrasia/actions/workflows/ci.yml/badge.svg)](https://github.com/kyaulabs/tmux-euphrasia/actions/workflows/ci.yml)
[![Contributor Covenant](https://img.shields.io/badge/contributor%20covenant-2.1-4baaaa.svg?logo=open-source-initiative&logoColor=4baaaa)](CODE_OF_CONDUCT.md)
[![GitHub License](https://img.shields.io/github/license/kyaulabs/tmux-euphrasia)](LICENSE)

A one-line tmux theme built from the Euphrasia terminal palette. It combines an
active-window block and session name on the left, a pill-shaped window list in
the center, and prefix/hostname information on the right.

## Requirements

- tmux 3.2 or newer
- A terminal configured for 256 colors or truecolor
- A Nerd Font for the window, host, and Powerline glyphs
- Optional: [`tmux-prefix-highlight`](https://github.com/tmux-plugins/tmux-prefix-highlight)

For truecolor, this tmux setting is recommended:

```tmux
set -g default-terminal "tmux-256color"
```

## Installation

### TPM

Add the plugin after `tmux-prefix-highlight`, when used:

```tmux
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @plugin 'kyaulabs/tmux-euphrasia'
```

Press `prefix + I` to install it with
[TPM](https://github.com/tmux-plugins/tpm), then reload the tmux configuration.

### Manual

```sh
git clone https://github.com/kyaulabs/tmux-euphrasia \
  ~/.tmux/plugins/tmux-euphrasia
```

Source the theme from `~/.tmux.conf`:

```tmux
source-file ~/.tmux/plugins/tmux-euphrasia/euphrasia.conf
```

## Palette

The theme is based on the original Euphrasia Xresources palette, with a custom
purple accent for the hostname pill:

| Role | Color | Hex |
| --- | --- | --- |
| Status background | Deep navy | `#090c19` |
| Hostname pill | Purple | `#73488b` |
| Surface | Black | `#1c2032` |
| Text | White | `#c0c0c0` |
| Muted text | Bright black | `#808080` |
| Active window (`1;36`) | Bright cyan | `#4dc5dc` |
| Window name (`0;35`) | Magenta | `#9f106f` |
| Prefix | Bright magenta | `#e413c2` |
| Activity | Bright yellow | `#fae32d` |
| Bell | Bright red | `#dc1216` |

## Layout

```text
┌ window-name  SESSION       ···  ( 1 ) ( 2 ) ( 3 )  ···       PREFIX  hostname ┐
```

The theme intentionally uses one bottom status row. tmux overflow markers remain
available when the centered window list is wider than the client.

## Files

- `tmux-euphrasia.tmux` — TPM entrypoint
- `euphrasia.conf` — palette, glyphs, and tmux styles
- `tests/smoke.sh` — isolated tmux-server smoke test

## Development

Run the same checks used by CI:

```sh
shellcheck tmux-euphrasia.tmux tests/smoke.sh
tests/smoke.sh
```

## Author

**kyau** — [https://kyaulabs.com](https://kyaulabs.com)

## License

[GNU Affero General Public License v3.0 or later](LICENSE)
