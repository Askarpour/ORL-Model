(load "TaskLib/ActionList.lisp")
(load "TaskLib/fcm.lisp")

(defvar action_indexes (loop for i from 1 to 6 collect i))
(defvar T1 1)


;;List of actions
;; 
;; op inserts a wp
;; op sends move signal to ro
;; arm approaches
;; op is holding the wp
;; op sends move signal to ro
;; arm retracts

(defconstant Config1
 (alwf (&&
   (SeqAction action_indexes 1)
   (mutually_exclusive2 action_indexes 1)
   (alwf(relativeProperties 1 1))
   (alwf(Operator_Body 1))
   (alwf(Robot_Structure 1))
   ;;List of actions 
   (insertp 1 1 4 1)
   (send_move_signal 2 1)
   (move 3 1 6 4 1)
   (op_hold 4 1 3 2 4)
   (send_move_signal 5 1)
   (move 6 1 4 6 1)
   (Alwf(!! (-P- Base_1_Moving)))
   (Alwf (-P- BASE_1_IN_L_3))
   (-> (basemoves (setq l '(3 6)) 1)(no_part_moving 1))

)))
