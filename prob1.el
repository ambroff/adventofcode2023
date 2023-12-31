(defun string/reverse (str)
  "Reverse the str where str is a string"
  (apply #'string (reverse (string-to-list str))))

(defun d1p1/first-digit (str)
  (let ((idx (string-match-p "[0-9]" str)))
    (substring str idx (+ idx 1))))

(defun d1p1/first-and-last-digit (input-string)
  "Given a string input-string, return the first and last digit found"
  (let ((first-digit (d1p1/first-digit input-string))
        (last-digit (d1p1/first-digit (string/reverse input-string))))
    (list first-digit last-digit)))

(defun d1p1/read-lines-as-list (filename)
  "Read all lines of a file into a list"
  (with-temp-buffer(insert-file-contents filename)
                   (split-string (buffer-string) "\n" t)))

(let ((input-lines (d1p1/read-lines-as-list "input1.txt")))
  (print (format "%d"
                 (apply #'+ (mapcar (lambda (input-str)
                                      (string-to-number (apply #'concat
                                                               (d1p1/first-and-last-digit input-str))))
                                    input-lines))
                 0)))
