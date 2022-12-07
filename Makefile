INIT_PACKAGE_EL="(progn \
  (require 'package) \
  (push '(\"melpa\" . \"https://melpa.org/packages/\") package-archives) \
  (package-initialize) \
  (unless package-archive-contents \
     (package-refresh-contents)))"

lint:
	emacs -Q -batch \
              --eval $(INIT_PACKAGE_EL) \
              -L . \
              --eval "(require 'package-lint)" \
              -f package-lint-batch-and-exit rubyfmt.el
