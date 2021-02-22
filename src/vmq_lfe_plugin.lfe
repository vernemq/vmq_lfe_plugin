;; This file is a template for a full LFE plugin for VerneMQ.
;; It shows how to implement the VerneMQ Plugin hooks.
;; You can leave out hooks you don't need.
(defmodule vmq_lfe_plugin
  (behaviour auth_on_register_hook)
  (behaviour auth_on_publish_hook)
  (behaviour auth_on_subscribe_hook)
  (behaviour on_register_hook)
  (behaviour on_publish_hook)
  (behaviour on_subscribe_hook)
  (behaviour on_unsubscribe_hook)
  (behaviour on_deliver_hook)
  (behaviour on_offline_message_hook)
  (behaviour on_client_wakeup_hook)
  (behaviour on_client_offline_hook)
  (behaviour on_client_gone_hook)
  (behaviour auth_on_register_m5_hook)
  (behaviour on_register_m5_hook)
  (behaviour auth_on_publish_m5_hook)
  (behaviour on_publish_m5_hook)
  (behaviour auth_on_subscribe_m5_hook)
  (behaviour on_subscribe_m5_hook)
  (behaviour on_auth_m5_hook)

  (export (auth_on_register 5)
          (auth_on_publish 6)
          (auth_on_subscribe 3)
          (on_register 3)
          (on_publish 6)
          (on_subscribe 3)
          (on_unsubscribe 3)
          (on_deliver 4)
          (on_offline_message 5)
          (on_client_wakeup 1)
          (on_client_offline 1)
          (on_client_gone 1))
  (export (auth_on_register_m5 6)
          (on_register_m5 4)
          (auth_on_publish_m5 7)
          (on_publish_m5 7)
          (on_deliver_m5 5)
          (auth_on_subscribe_m5 4)
          (on_subscribe_m5 4)
          (on_unsubscribe_m5 4)
          (on_auth_m5 3))
 (export  (start 0)
          (stop 0)))

(include-file "vernemq_dev.hrl")
(include-lib "logjam/include/logjam.hrl")

;;;==================================================================
;;; Plugin Callbacks
;;;==================================================================

(defun start () 
        (application:ensure_all_started 'vmq_lfe_plugin)
        'ok)

(defun stop ()
        (application:stop 'vmq_lfe_plugin))

;;;===================================================================
;;; VerneMQ Plugin Hooks
;;;===================================================================

(defun auth_on_register ((( = `#(,_ip-addr ,_port) peer)
                        ( = `#(,_mountpoint ,_client-id) subscriber-id) 
                         username password clean-session)

  (log-info "auth_on_register: ~p ~p ~p ~p ~p" `(,peer ,subscriber-id ,username ,password ,clean-session))
  'ok))

(defun auth_on_publish ((username (= `#(,mountpoint ,client-id) subscriber-id) qos topic payload is-retain)
  (log-info "auth_on_publish: ~p ~p ~p ~p ~p ~p" `(,username ,subscriber-id ,qos ,topic ,payload ,is-retain))
  'ok))

(defun auth_on_subscribe ((username client-id (= (cons `#(,_topic ,_qos) _) topics))
  (log-info "auth_on_subscribe: ~p ~p ~p" `(,username ,client-id ,topics))
  'ok))

(defun on_register (((= `#(,_ip-address ,_port) peer) (= `#(,_mountpoint ,_client-id) subscriber-id) username)
  (log-info "on_register: ~p ~p ~p" `(,peer ,subscriber-id ,username))
  'ok))

(defun on_publish ((username (= `#(,_mountpoint ,_client-id) subscriber-id) qos topic payload is-retain)
  (log-info "on_publish: ~p ~p ~p ~p ~p ~p" `(,username ,subscriber-id ,qos ,topic ,payload ,is-retain))
  'ok))

(defun on_subscribe ((username (= `#(,_mountpoint ,_client-id) subscriber-id) (= (cons `#(,_topic ,_qos) _) topics))
  (log-info "on_subscribe: ~p ~p ~p" `(,username ,subscriber-id ,topics))
  'ok))

(defun on_unsubscribe ((username (= `#(,_mountpoint ,_client-id) subscriber-id) (= (cons `#(,_topic ,_qos) _) topics))
  (log-info "on_unsubscribe: ~p ~p ~p" `(,username ,subscriber-id ,topics))
  'ok))

(defun on_deliver ((username (= `#(,_mountpoint ,_client-id) subscriber-id) topic payload)
  (log-info "on_deliver: ~p ~p ~p" `(,username ,subscriber-id ,topic ,payload))
  'ok))

(defun on_offline_message (((= `#(,_mountpoint ,_client-id) subscriber-id) qos topic payload is-retain)
  (log-info "on_offline_message: ~p ~p ~p ~p ~p" `(,subscriber-id ,qos ,topic ,payload ,is-retain))
  'ok))

(defun on_client_wakeup (((= `#(,_mountpoint ,_client-id) subscriber-id))
  (log-info "on_client_wakeup: ~p" `(,subscriber-id))
  'ok))

(defun on_client_offline (((= `#(,_mountpoint ,_client-id) subscriber-id))
  (log-info "on_client_offline: ~p" `(,subscriber-id))
  'ok))

(defun on_client_gone (((= `#(,_mountpoint ,_client-id) subscriber-id))
  (log-info "on_client_gone: ~p" `(,subscriber-id))
  'ok))

;; MQTT 5 Hooks

(defun auth_on_register_m5 (((= `#(,ip-address, ,_port) peer)
  (= `#(mounpoint client-id) subscriber-id) username password clean-start props)
  (log-info "auth_on_register_m5: ~p ~p ~p ~p ~p ~p" `(,peer ,subscriber-id ,username ,password ,clean-start ,props))
  'ok))

(defun on_register_m5 (((= `#(,ip-address, ,_port) peer)
  (= `#(mounpoint client-id) subscriber-id) username props)
  (log-info "on_register_m5: ~p ~p ~p ~p" `(,peer ,subscriber-id ,username ,props))
  'ok))

(defun auth_on_publish_m5 ((username (= `#(,mountpoint ,client-id) subscriber-id) qos topic payload is-retain props)
  (log-info "auth_on_publish_m5: ~p ~p ~p ~p ~p ~p ~p" `(,username ,subscriber-id ,qos ,topic ,payload ,is-retain ,props))
  'ok))

(defun on_publish_m5 ((username (= `#(,mountpoint ,client-id) subscriber-id) qos topic payload is-retain props)
  (log-info "on_publish_m5: ~p ~p ~p ~p ~p ~p ~p" `(,username ,subscriber-id ,qos ,topic ,payload ,is-retain ,props))
  'ok))

(defun auth_on_subscribe_m5 ((username (= `#(,_mountpoint ,_client-id) subscriber-id) (= (cons `#(,_topic ,_qos) _) topics) props)
  (log-info "auth_on_subscribe_m5: ~p ~p ~p" `(,username ,subscriber-id ,topics ,props))
  'ok))

(defun on_deliver_m5 ((username (= `#(,_mountpoint ,_client-id) subscriber-id) topic payload props)
  (log-info "on_deliver_m5: ~p ~p~p ~p ~p" `(,username ,subscriber-id ,topic ,payload ,props))
  'ok))

(defun on_subscribe_m5 ((username (= `#(,_mountpoint ,_client-id) subscriber-id) (= (cons `#(,_topic ,_qos) _) topics) props)
  (log-info "on_subscribe_m5: ~p ~p ~p ~p" `(,username ,subscriber-id ,topics ,props))
  'ok))

(defun on_unsubscribe_m5 ((username (= `#(,_mountpoint ,_client-id) subscriber-id) (= (cons `#(,_topic ,_qos) _) topics) props)
  (log-info "on_unsubscribe_m5: ~p ~p ~p ~p" `(,username ,subscriber-id ,topics ,props))
  'ok))

(defun on_auth_m5 ((username (= `#(,_mountpoint ,_client-id) subscriber-id) props)
  (log-info "on_auth_m5: ~p ~p ~p" `(,username ,subscriber-id ,props))
  'ok))