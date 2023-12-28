(defun string/reverse (str)
  "Reverse the str where str is a string"
  (apply #'string (reverse (string-to-list str))))

(defun d1p1/first-digit (str)
  (let ((idx (string-match-p "[0-9]" str)))
    (message "foo")
    (substring str idx (+ idx 1))))

(defun d1p1/first-and-last-digit (input-string)
  "Given a string input-string, return the first and last digit found"
  (let ((first-digit (d1p1/first-digit input-string))
        (last-digit (d1p1/first-digit (string/reverse input-string))))
    (list first-digit last-digit)))

(setq test-input-contents (list
                           "1abc2\n"
                           "pqr3stu8vwx\n"
                           "a1b2c3d4e5f\n"
                           "treb7uchet\n"))

(apply #'+ (mapcar (lambda (input-str)
                     (string-to-number (apply #'concat (d1p1/first-and-last-digit input-str))))
                   test-input-contents))
;; Is 142
