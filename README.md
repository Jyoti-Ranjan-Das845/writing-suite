# Writing Suite

Writing Suite is a reusable workflow for creating clear, grounded, and review-ready written artifacts with Claude Code or Codex. It separates requirements, content grounding, authoring authority, drafting, and independent review so that a polished document does not substitute for missing evidence or unclear ownership.

Use it for documents such as README files, reports, memos, proposals, emails, posts, and technical designs.

## How it works

Each artifact follows a deliberate sequence:

1. **Writing Requirements** turns the request into explicit, actionable obligations.
2. **Content Grounding** prepares the minimum source-backed content needed to meet them.
3. **Authoring Contract** records what the Writer may use, infer, verify, correct, or invent, and confirms readiness.
4. **Writer** drafts the artifact and performs justified revisions.
5. **Reviewer** independently evaluates the draft without editing it.

The Writer and Reviewer repeat the revision loop until the review passes or a blocker is recorded.

## Install

Run the installer from a Writing Suite checkout:

```bash
./install/install.sh
```

The installer detects Claude Code and Codex and, when run interactively, offers the available installation choices.

For non-interactive use, select the client explicitly:

```bash
./install/install.sh --claude --yes
./install/install.sh --codex --yes
./install/install.sh --all --yes
```

If no client-selection flag is supplied without interactive input, the installer makes no changes and explains how to choose a client.

### What the installer adds

The installer copies the portable runtime into:

```text
${XDG_DATA_HOME:-$HOME/.local/share}/writing-suite/current
```

It then creates a `writing-suite` symlink for each selected client:

| Client | Default skill path |
|---|---|
| Claude Code | `${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills/writing-suite` |
| Codex | `$HOME/.agents/skills/writing-suite` |

The managed runtime contains only the suite runtime: `SKILL.md`, `skills/`, `standards/`, `templates/`, and `standards-registry.md`. The installer does not replace an existing real file, directory, foreign symlink, or broken symlink at a client target.

## Verify and uninstall

Verify the source bundle, managed runtime, manifest checksums, and client links:

```bash
./install/verify.sh
```

Remove managed client links:

```bash
./install/uninstall.sh --claude
./install/uninstall.sh --codex
./install/uninstall.sh --all --yes
```

Uninstall removes only links that point to the managed Writing Suite runtime. In non-interactive `--yes` mode, the managed copy is retained after links are removed.

## Use the suite

`SKILL.md` is the canonical entry point. Start there when you want the suite to create or substantially revise a written artifact.

For each artifact, the suite keeps its working state in the project that owns the artifact:

```text
.writing/
├── registry.md
└── <artifact-name>/
    ├── requirements.md
    ├── grounding.md
    ├── authority.md
    └── review.md
```

The final document stays at its requested project path. The `.writing/` directory holds the compact state that lets each stage hand off to the next without duplicating the deliverable.

## Standards

The suite always applies its universal writing standard. It can also select a genre or channel standard when the artifact calls for one. The canonical index is [`standards-registry.md`](standards-registry.md).

## Repository map

```text
SKILL.md                         Overall workflow and orchestration
skills/                          Stage-specific instructions
standards-registry.md            Index of reusable writing standards
standards/                       Universal, genre, and channel standards
templates/                       Runtime-state shapes
install/install.sh               Install for Claude Code and/or Codex
install/uninstall.sh             Remove managed client links
install/verify.sh                Validate source, runtime, and client links
```

## Commands

```bash
# Show installer usage
./install/install.sh --help

# Install for both detected clients without prompts
./install/install.sh --all --yes

# Check installation health
./install/verify.sh

# Remove all managed client links while retaining the managed copy
./install/uninstall.sh --all --yes
```
