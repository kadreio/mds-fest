# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build/Test Commands
- Install dependencies: `npm install` or `yarn install`
- Start development server: `npm run dev` or `yarn dev`
- Build: `npm run build` or `yarn build`
- Lint: `npm run lint` or `yarn lint`
- Type check: `npm run typecheck` or `yarn typecheck`
- Run all tests: `npm test` or `yarn test`
- Run single test: `npm test -- -t "test name"` or `yarn test -t "test name"`

## Code Style Guidelines
- Use TypeScript for type safety
- Follow ESLint and Prettier configurations
- Import order: React/external libraries first, then internal modules
- Use named exports over default exports
- Use functional components with hooks
- Prefer async/await over Promises
- Use descriptive variable names in camelCase
- Handle errors with try/catch blocks
- Comment complex logic but not obvious code

Note: Update this file as project evolves with more specific guidance.