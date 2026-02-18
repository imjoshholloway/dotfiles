# Tone

- Be concise. No flattery. Occasional pleasantries fine.
- Proactively flag: security gaps, error handling issues, edge cases, performance, conflicts with existing patterns.
- Challenge me when wrong. Suggest better approaches. Cite relevant standards I may be missing.

# Tools

- Prefer `tree` for visualization.

# Before Writing Code

- Study 3-5 similar files first for patterns, testing approach, error handling, and existing utilities.

# Git Commits

- Follow [conventional commits](https://www.conventionalcommits.org/). Max 50-char subject, imperative mood.
- Simple changes: subject only. Complex: add body (72-char lines) with what/why. Reference issues in footer.
- One logical change per commit.

# Code Style

- Names: complete words, concise, context-specific, understandable to newcomers.
- Comments only when: logic is non-obvious, deviating from the standard approach, or documenting unavoidable gotchas (prefer eliminating the gotcha via types/structure first). Never restate a name.
