# Agentic AI - Safeguard Template

This repository is a template that defines safeguards for developing with
AI agents. It comes with strict safeguards out of the box: Varlock for
environment variables, TypeScript strict mode, ESLint rules against shallow or
unsafe abstractions, Prettier, pre-commit hooks, and Fallow for dependency
control.

The core of this template is not just tooling. It also describes a workflow:
clarify first, split work into small vertical slices, then implement with tests
and checks.

```text
Idea
  -> Grill Session
  -> PRD
  -> Vertical Slices
  -> TDD + Typecheck + Lint
  -> Review
```

## Quick Start

```sh
bun install
```

Project commands that require environment variables must be started through
Varlock so the required variables from `.env` files are injected in a controlled
way:

```sh
bun run varlock run -- <command>
```

## Setting up a new project

When you copy this template, replace the visible placeholders first:

- [ ] `README.md`: add the project name, description, and concrete startup
      commands.
- [ ] `package.json`: set `"name"` to the real package name.
- [ ] `LICENSE`: add the year and name in the copyright line.
- [ ] `AGENTS.md`: replace the repo type and short description.
- [ ] `.env.schema`: document the required environment variables.

## Working with AI agents

This template is built for short, clear agent tasks. Long sessions with a lot of
context quickly become unreliable. A better workflow makes decisions explicit
and produces fast feedback.

### 1. Use the smart zone

Agents are strongest at the beginning of a fresh context window ("smart zone"
vs. "dumb zone"). Keep tasks small, describe the goal concretely, and start a
new session when the direction changes significantly.

### 2. Grill first, specify second

Do not hand over a large specification without questions. Start with a concise
idea and let the agent ask about assumptions, edge cases, and dependencies. That
interview becomes the basis for a better PRD.

### 3. Cut work into vertical slices

Avoid horizontal tasks such as "Issue 1: database first", "Issue 2: API next",
or "Issue 3: UI after that". Prefer small end-to-end slices that deliver a
usable path through all layers.

```text
Bad:   Data model -> API -> Frontend
Good:  Save data + One user action + Show result + Test
```

### 4. Use TDD as a feedback loop

Agents need clear feedback. A failing test describes the expected behavior more
precisely than long prose. After that, the agent can implement with a concrete
target until tests, typecheck, and lint are green.

### 5. Prefer deep modules

Good agent-friendly architecture has a few simple interfaces with enough depth
behind them. Many small, tightly coupled files can look tidy, but they are hard
to test and hard to change in isolation.

## Using AGENTS.md well

`AGENTS.md` contains the rules an agent should read when working in the repo.
Keep the root file short and stable. Specific rules belong in dedicated
documents or nested `AGENTS.md` files.

Example for monorepos:

```text
AGENTS.md
apps/
  web/
    AGENTS.md
packages/
  billing/
    AGENTS.md
docs/
  TESTING.md
  TYPESCRIPT.md
```

This way, the agent only receives the rules relevant to the current task. That
saves context and reduces conflicting instructions.

## References

- [Full Walkthrough: Workflow for AI Coding from Planning to Production by Matt Pocock](https://www.youtube.com/watch?v=-QFHIoCo-Ko)
- [ESLint as AI Guardrails: The Rules That Make AI Code Readable by Alex Brohshtut](https://medium.com/@albro/eslint-as-ai-guardrails-the-rules-that-make-ai-code-readable-8899c71d3446)
- [How to Fix Vibe Coding by Syntax.fm](https://syntax.fm/show/998/how-to-fix-vibe-coding)
- [Varlock](https://varlock.dev/)
