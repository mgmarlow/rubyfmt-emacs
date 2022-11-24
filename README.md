# rubyfmt-emacs

Format Ruby code with [rubyfmt](https://github.com/penelopezone/rubyfmt) in Emacs.

## Installation

Clone the repo:

```
git clone https://github.com/mgmarlow/rubyfmt-emacs.git ~/projects/rubyfmt-emacs/
```

Example with use-package:

```el
(use-package rubyfmt
  :load-path "~/projects/rubyfmt-emacs/"
  :custom
  ;; Point this path to your rubyfmt binary
  (rubyfmt-binary-path "~/rubyfmt"))
```
