;;Pastel theme
(require 'autothemer)

(autothemer-deftheme
  past "A comfy pastel theme for emacs"

((((class color) (min-colors #xFFFFFF)))

;;color palette
 (pastblack	"#000000")

 (pastWhite    "#FFFFFF")
 (pastwhite	"#EFEFEF")

 (pastred1	"#FEA3AA")
 (pastred2	"#FEA3AA")

 (pastyellow1	"#FAF884")
 (pastyellow2	"#FFFFBA")

 (pastpurple1	"#F2A2E8")
 (pastpurple2	"#E6BFF0")

 (pastgreen1	"#72FF72")
 (pastgreen2	"#77DD77")

 (pastblue1	"#B2CEFE")
 (pastblue2	"#A3FFF7")
 )

;;customize faces
(
;;normal
 (default			(:foreground pastblack :background pastwhite))
 (cursor			(:background pastblue1)) 
 (region			(:background pastblue2))
 (mode-line			(:background pastpurple1))
 (font-lock-keyword-face	(:foreground pastgreen1))
 (font-lock-constant-face	(:foreground pastgreen2))
 (font-lock-string-face		(:foreground pastpurple1))
 (font-lock-comment-face        (:foreground pastred1))
 (font-lock-function-name-face  (:foreground pastred2))
;;Org-mode

;;LaTeX

;;HTML

;;CSS

;;Matlab

;;R

;;Scheme

))

(provide-theme 'past)
