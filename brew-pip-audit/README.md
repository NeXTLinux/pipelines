## The repo

The following things can be found in this repository:

- `formula2requirements.rb`: Extracts the Python dependencies from Homebrew
  and writes them out in the `requirements.txt` format.
- `pip-audit-bulk`: Runs `pip-audit` over a directory of `requirements.txt`
  files.
- `generate-prs.rb`: Automatically generates PRs against
  `Homebrew/homebrew-core` for formulae with vulnerable dependencies.
- `requirements/`: The extracted `requirements.txt` file for each Homebrew
  formula.
- `audits/`: The result of `pip-audit` for each Homebrew formula. There will
  only be a file present if vulnerabilities were found.

`requirements/` and `audits/` are automatically refreshed on a daily basis by
Github Actions.
