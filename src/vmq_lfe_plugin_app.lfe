(defmodule vmq_lfe_plugin_app
  (behaviour application)
  (export
    ;; app implementation
    (start 2)
    (stop 0)))

;;; --------------------------
;;; application implementation
;;; --------------------------

(defun start (_type _args)
  (logger:set_application_level 'vmq_lfe_plugin 'all)
  (logger:info "Starting vmq_lfe_plugin application ...")
  (io:format "STARTING LFE PLUGIN")
  (vmq_lfe_plugin_sup:start_link))

(defun stop ()
  (vmq_lfe_plugin_sup:stop)
  'ok)
