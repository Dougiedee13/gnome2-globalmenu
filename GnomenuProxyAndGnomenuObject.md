# Introduction #

GnomenuProxy and GnomenuObject.

GnomenuObject objects provide methods, and emit signals

GnomenuProxy is the client side adapter of the GnomenuObject.

common code:

**`resolve(queue, queuelock, funclock, call_back, data)`
  * if TRY\_LOCK(funclock) fail quits
  * LOCK(queuelock)
  * pop a item from queue
  * UNLOCK(queuelock)
  * loop:
  * invoke call\_back(data, item)
  * LOCK(queuelock)
  * try pop a message
  * if fails UNLOCK(funclock), UNLOCK(queuelock) and return
  * UNLOCK(queuelock)
  * goto loop**

GnomenuProxy:

  * priv->window has the following properties:
    * `_METHOD_CALL`
    * `_METHOD_RETURN`
    * `_SIGNAL`
  * priv->call\_queue;

  * Sends ClientMessage
    * `MSG_METHOD_CALL`
    * `MSG_SIGNAL_ACK`

  * Behavior
    * `invoke(id, args, bytes, ret, ret_bytes)`
      * TRY\_LOCK(loop)
        * start a mainloop `priv->loop`;
        * set `_METHOD_CALL` to id + bytes + args;
        * store `_METHOD_CALL` to quark `current-data`
        * wait until `priv->loop` ends;
        * free the loop.
        * start a main loop `priv->loop`;
        * send `MSG_METHOD_CALL`
        * wait until `priv->loop` ends;
        * get return value from `_METHOD_RETURN`;
        * free the loops.
        * UNLOCK(loop)
    * `bind`
      * find the window at `priv->path`
      * set target to the window;
      * `invoke(REGISTER, my window + version, ret, ret_bytes)`
      * if no ret or ret is failure, return failure.
    * `unbind`
      * `invoke(UNREGISTER, my window + versoin, ret, ret_bytes)`
      * if no ret or ret is failure, return failure.
    * `MSG_SIGNAL`
      * when a `MSG_SIGNAL` is received.
      * get args from `_SIGNAL`.
      * send `MSG_SIGNAL_ACK`
      * emit object signal `::signal`
    * `MSG_METHOD_RETURN`
      * stop `priv->loop`;
    * `PropertyNotify::_METHOD_CALL`
      * Get the property.
      * If the property `_METHOD_CALL` == quark `current-data` stop `priv->loop`;

GnomenuOjbect:
  * priv->call\_queue.
  * priv->signal\_queue.

  * Sends ClientMessage:
    * `MSG_SIGNAL`
    * `MSG_METHOD_RETURN`
  * Behaviors
    * `method::bind`
      * check version, objtype
      * add the proxy into binded proxy
    * `method::unbind`
      * check version, objtype
      * remove the proxy from binded proxy
    * `signal(id, arg, bytes)`
      * TRY\_LOCK(loop) -> fail
      * for every binded proxy
        * start a `priv->loop`
        * set current proxy to quark `current-proxy`
        * set signal data to `current-data`
        * set proxy window's `_SIGNAL`
        * if fails, stop `priv->loop`, goto next proxy
        * wait for `priv->loop` quits
        * send MSG\_SIGNAL.
      * UNLOCK(loop)
    * `MSG_METHOD_CALL`
      * TRY\_LOCK(loop) -> fail
        * invoke `method` to obtain retval.
        * start a `priv->loop`
        * store calling proxy into `current proxy`
        * store retval to `current data`
        * set source window's `_METHOD_RETURN`.
        * wait for `priv->loop`
        * send MSG\_METHOD\_RETURN
      * UNLOCK(loop)
    * `PropertyNotify::_SIGNAL` at proxy window
      * if `window` == `current proxy` and `_SIGNAL` == `current data`,
> > > > stop `priv->loop`.
    * `PropertyNotify::_METHOD_RETURN`
      * if `window` == `current proxy` and `_METHOD_RETURN` == `current data`
> > > > stop `priv->loop`