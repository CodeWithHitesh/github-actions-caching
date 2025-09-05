# Branch Protection Guidelines

Configure the `main` branch with the following rules:

- **Require pull request reviews** before merging.
- **Require status checks to pass** for the CI workflow.
- **Restrict direct pushes**, except for administrators who may bypass
  the rules when necessary.

These settings help ensure code quality and maintain a stable `main`
branch while still allowing admins to perform emergency fixes.
