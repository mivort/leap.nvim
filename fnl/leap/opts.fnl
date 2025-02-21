(local M {:default {:max_phase_one_targets nil
                    :highlight_unlabeled_phase_one_targets false
                    :max_highlighted_traversal_targets 10
                    :case_sensitive false
                    :equivalence_classes [" \t\r\n"]
                    :substitute_chars {}
                    :safe_labels ["s" "f" "n" "u" "t" "/"
                                  "S" "F" "N" "L" "H" "M" "U" "G" "T" "?" "Z"]
                    :labels ["s" "f" "n"
                             "j" "k" "l" "h" "o" "d" "w" "e" "m" "b"
                             "u" "y" "v" "r" "g" "t" "c" "x" "/" "z"
                             "S" "F" "N"
                             "J" "K" "L" "H" "O" "D" "W" "E" "M" "B"
                             "U" "Y" "V" "R" "G" "T" "C" "X" "?" "Z"]
                    :special_keys {:repeat_search "<enter>"
                                   :next_phase_one_target "<enter>"
                                   :next_target ["<enter>" ";"]
                                   :prev_target ["<tab>" ","]
                                   :next_group "<space>"
                                   :prev_group "<tab>"
                                   :multi_accept "<enter>"
                                   :multi_revert "<backspace>"}}
          ; Will be updated by `leap` on invocation.
          :current_call {}})

; First try to look up everything in the `current_call` table,
; so that we can override settings on a per-call basis.
(setmetatable M
              {:__index (fn [self key]
                          (case (. self.current_call key)
                            nil (. self.default key)
                            val val  ; `false` should be returned too
                            ))})
