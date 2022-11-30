;;; rubyfmt.el --- Format code with rubyfmt -*- lexical-binding: t -*-

;; Author: Graham Marlow
;; Maintainer: Graham Marlow
;; URL: https://github.com/mgmarlow/rubyfmt-emacs
;; Version: 0.1.0

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;; Formats Ruby code with 'rubyfmt' Use the command 'rubyfmt-format' to
;; format the current buffer, or enable the 'rubyfmt-mode' minor mode
;; to format on save.

;;; Code:

(defcustom rubyfmt-binary-path nil
  "Path to rubyfmt binary."
  :type 'string)

(defcustom rubyfmt-options "--fail-fast --header-opt-out --silence-update-message"
  "Options passed into rubyfmt.")

(defun rubyfmt--cmd-with-options ()
  (concat rubyfmt-binary-path " " rubyfmt-options))

(defun rubyfmt-format ()
  "Runs 'rubyfmt -i' on the current buffer."
  (interactive)
  (let ((outbuf (get-buffer-create "*rubyfmt patch*"))
        (errbuf (get-buffer-create "*rubyfmt error*")))
    (save-restriction
      (widen)
      (with-current-buffer outbuf
        (erase-buffer))
      (if (zerop
           (shell-command-on-region
            (point-min) (point-max) (rubyfmt--cmd-with-options) outbuf nil errbuf t))
          (progn
            (replace-buffer-contents outbuf)
            (message "Applied rubyfmt to current buffer.")
            (kill-buffer errbuf))
        (message "Failed to apply rubyfmt to current buffer."))
      (kill-buffer outbuf))))

;;;###autoload
(define-minor-mode rubyfmt-mode
  "Runs rubyfmt on save."
  :lighter " Rubyfmt"
  :global nil
  (if rubyfmt-mode
      (add-hook 'before-save-hook 'rubyfmt-format nil 'local)
    (remove-hook 'before-save-hook 'rubyfmt-format 'local)))

(provide 'rubyfmt)
;;; rubyfmt.el ends here
