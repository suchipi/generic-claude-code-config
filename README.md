# generic-claude-code-config

A reusable starting point for [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) configuration, extracted from [suchipi/quickjs](https://github.com/suchipi/quickjs). Drop the `.claude/` directory into a repo to get a curated set of behavioral rules and a narrow permissions allowlist.

## Usage

Copy the `.claude/` directory into the root of your project:

```sh
git clone https://github.com/suchipi/generic-claude-code-config.git
cp -R generic-claude-code-config/.claude /path/to/your/repo/
```

Commit it alongside your code so Claude picks it up on every session. Edit or remove individual rules in [.claude/rules/](.claude/rules/) to fit the project.

## What's inside

### [.claude/settings.json](.claude/settings.json)

A narrow permissions allowlist — read-only shell commands and read-only git commands are pre-approved so Claude doesn't block on permission prompts during routine exploration. Anything that mutates state (git commits, file writes via shell, etc.) still requires explicit approval.

Also registers `.tmp/`, `/tmp`, and `/private/tmp` as additional working directories.

### [.claude/rules/](.claude/rules/)

Behavioral rules loaded into every session. Each rule is a Markdown file with optional YAML frontmatter specifying which paths it applies to (see [claude-rules-conventions.md](.claude/rules/claude-rules-conventions.md)).

| Rule                                                                               | Purpose                                                                                                                  |
| ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| [general-behavioral-guidelines.md](.claude/rules/general-behavioral-guidelines.md) | Karpathy-style guidelines: think before coding, keep it simple, make surgical changes, define success criteria.          |
| [no-assumptions-in-answers.md](.claude/rules/no-assumptions-in-answers.md)         | Direct questions require verified answers with cited sources — no guessing.                                              |
| [understand-before-fixing.md](.claude/rules/understand-before-fixing.md)           | Read and trace the code before attempting fixes; no random stabs.                                                        |
| [use-approved-tools-only.md](.claude/rules/use-approved-tools-only.md)             | Prefer the dedicated tools (Read, Edit, Grep, Glob, Write) over shell equivalents that would trigger permission prompts. |
| [use-repo-tmp-dir.md](.claude/rules/use-repo-tmp-dir.md)                           | Use `.tmp/` in the repo root (gitignored) for scratch files instead of `/tmp`.                                           |
| [no-git-mutations.md](.claude/rules/no-git-mutations.md)                           | No `git commit`, `push`, `merge`, `rebase`, etc. without explicit user approval.                                         |
| [no-self-modification.md](.claude/rules/no-self-modification.md)                   | No editing `CLAUDE.md`, `.claude/rules/`, or `.claude/settings*.json` without explicit user approval.                    |
| [claude-rules-conventions.md](.claude/rules/claude-rules-conventions.md)           | The format convention for rule files themselves.                                                                         |

## Philosophy

The rules bias toward **caution over speed**: fewer unnecessary changes, fewer rewrites from overcomplication, and clarifying questions before mistakes. The permissions allowlist follows the same principle — Claude can explore freely but has to ask before mutating anything.

## License

MIT
