This is a <type of repo> for <short description>.

## Running the Project

This project is not started with normal commands; instead, it must be run via `varlock run -- <command>` so that environment variables are injected by varlock. Run `bun run varlock run --help` to see further information.

## Package Manager

Default to Bun instead of Node.js (npm/yarn/pnpm). Use Bun's built-in features like `bun test`, `bun:sqlite`, etc. For more, see `node_modules/bun-types/docs/**.mdx` or https://bun.com/llm.txt.
