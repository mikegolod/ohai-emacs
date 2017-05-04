;;; -*- lexical-binding: t -*-
;;; ohai-flow.el --- JavaScript is slightly less horrid with types.

;; Copyright (C) 2015 Bodil Stokke

;; Author: Bodil Stokke <bodil@bodil.org>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(use-package flycheck-flow)

(use-package company-flow)

(use-package flow-minor-mode
  :config
  ;; Configure js2 mode
  (with-eval-after-load 'js2-mode
    (setq-default
     js2-mode-indent-ignore-first-tab t
     js2-strict-inconsistent-return-warning nil
     js2-global-externs
     '("module" "require" "__dirname" "process" "console" "JSON" "$" "_")
     js2-mode-show-parse-errors nil
     js2-mode-show-strict-warnings nil
     )
    )
  (with-eval-after-load 'flycheck
    (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
    (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
    (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-flow))
  (with-eval-after-load 'projectile
    (add-to-list 'projectile-project-root-files ".flowconfig"))
  (setq flow-binary (or (ohai/resolve-exec "flow") "flow"))
  (add-to-list 'auto-mode-alist '("\\.flowconfig\\'" . conf-mode)))



(provide 'ohai-flow)
;;; ohai-flow.el ends here
