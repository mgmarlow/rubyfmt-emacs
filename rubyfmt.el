;;; rubyfmt.el --- Format code with rubyfmt -*- lexical-binding: t -*-

;; Author: Graham Marlow
;; Maintainer: Graham Marlow
;; URL: https://github.com/mgmarlow/rubyfmt-emacs
;; Version: 0.1.0

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

(defcustom rubyfmt-binary-path nil
  "Path to rubyfmt binary."
  :type 'string)

(defcustom rubyfmt-options "--fail-fast --header-opt-out --silence-update-message"
  "Options passed into rubyfmt.")

(defun rubyfmt--replace-buffer-command (file-name)
  (concat rubyfmt-binary-path " -i " rubyfmt-options " -- " file-name))

(defun rubyfmt-format ()
  "Runs 'rubyfmt -i' on the current buffer."
  (interactive)
  (if rubyfmt-binary-path
      (shell-command
       (rubyfmt--replace-buffer-command (buffer-file-name))
       nil
       "*Rubyfmt Error Buffer*")
    (error "Set `rubyfmt-binary-path` before using `rubyfmt-format`.")))

(provide 'rubyfmt)
;;; rubyfmt.el ends here
