# rubyfmt-emacs

Format Ruby code with [rubyfmt](https://github.com/penelopezone/rubyfmt) in Emacs.

## Installation

Clone the repo:

```
git clone https://github.com/mgmarlow/rubyfmt-emacs.git ~/projects/rubyfmt-emacs/
```

Example configuration with use-package:

```el
(use-package rubyfmt
  :load-path "~/projects/rubyfmt-emacs/"
  :custom
  ;; Point this path to your rubyfmt binary
  (rubyfmt-binary-path "/opt/homebrew/bin/rubyfmt")
  ;; If you want to run format on save
  :hook (ruby-mode . rubyfmt-mode))
```

## Development

Use [package-lint](https://github.com/purcell/package-lint) to make sure your changes follow Emacs package conventions.

1. Install package-lint in Emacs: `M-x package-install package-lint`
2. Lint the repo: `make lint`

Optionally, `M-x package-install package-lint-flymake` and use `flymake-mode` when working in `rubyfmt.el`.
