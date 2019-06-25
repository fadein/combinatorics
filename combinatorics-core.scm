(define ordered-subset-for-each
  (case-lambda
   ((f list)
    (ordered-subset-for-each f list (length list)))
   ((f list k)
    (let iter ((list list)
               (k k) 
               (subset '()))
      (if (zero? k)
          (f subset)
          (for-each
              (lambda (element)
                (iter (delete element list)
                      (sub1 k)
                      (cons element subset)))
            list))))))

(define ordered-subset-fold
  (case-lambda
   ((cons nil list)
    (ordered-subset-fold cons nil list (length list)))
   ((cons nil list k)
    (let ((nil (make-parameter nil)))
      (ordered-subset-for-each
       (lambda (subset)
         (nil (cons subset (nil))))
       list k)
      (nil)))))

(define ordered-subset-map
  (case-lambda
   ((f list) (ordered-subset-map f list (length list)))
   ((f list k)
    (ordered-subset-fold (lambda (v a) (cons (f v) a)) '() list k))))

(define (project subset list)
  (vector-fold (lambda (i projection j)
                 (cons (list-ref list j) projection))
               '()
               subset))

;;; Thanks, Daniel Ángel Jiménez:
;;; <http://www.cs.utexas.edu/users/djimenez/utsa/cs3343/lecture25.html>.
(define unordered-subset-for-each
  (case-lambda
   ((f list)
    (unordered-subset-for-each f list (length list)))
   ((f list k)
    (let ((subset (make-vector k))
          (n (length list)))
      (let iter ((start 0)
                 (p 0))
        (if (= p k)
            (f (project subset list))
            (do ((i start (+ i 1)))
                ((= i n))
              (vector-set! subset p i)
              (iter (add1 i) (add1 p)))))))))

(define unordered-subset-fold
  (case-lambda
   ((cons nil list)
    (unordered-subset-fold cons nil list (length list)))
   ((cons nil list k)
    (let ((nil (make-parameter nil)))
      (unordered-subset-for-each
       (lambda (subset)
         (nil (cons subset (nil))))
       list
       k)
      (nil)))))

(define unordered-subset-map
  (case-lambda
   ((f list) (unordered-subset-map f list (length list)))
   ((f list k)
    (unordered-subset-fold (lambda (v a) (cons (f v) a)) '() list k))))

(define permutation-for-each
  ordered-subset-for-each)

(define permutation-fold
  ordered-subset-fold)

(define permutation-map
  ordered-subset-map)

(define combination-for-each
  unordered-subset-for-each)

(define combination-fold
  unordered-subset-fold)

(define combination-map
  unordered-subset-map)
