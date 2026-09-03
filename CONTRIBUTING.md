# Contributing

Thanks for taking an interest in tmux-euphrasia.

## Reporting issues

Use the repository's bug report or feature request template. Include your tmux
version, terminal, `$TERM` value, font, operating system, and the smallest
configuration that reproduces the problem.

## Pull requests

1. Fork the repository and branch from `develop`.
2. Keep the existing one-row layout unless the change has been discussed first.
3. Use colors from the Euphrasia palette in `euphrasia.conf`.
4. Update documentation when behavior changes.
5. Run the checks below.
6. Submit a focused pull request using a Conventional Commit title.

```sh
shellcheck tmux-euphrasia.tmux tests/smoke.sh
tests/smoke.sh
```

Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/):

```text
<type>[optional scope]: <description>
```

Common types are `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `ci`, and
`chore`.

Contributions are licensed under the same [AGPL-3.0-or-later license](LICENSE)
as the project. Community participation is governed by the
[Code of Conduct](CODE_OF_CONDUCT.md).
