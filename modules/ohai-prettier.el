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

(require 'prettier-js)

(add-hook 'web-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'prettier-before-save)))

(add-hook 'js-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'prettier-before-save)))

(add-hook 'rjsx-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'prettier-before-save)))

(provide 'ohai-prettier)
;;; ohai-prettier.el ends here
