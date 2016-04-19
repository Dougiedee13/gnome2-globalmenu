**We are using SMS and window properties for IPC in 0.5 branch**


Detailed design after some coding:

gnomenu\_socket\_new
gnomenu\_socket\_is\_alive
gnomenu\_socket\_send
gnomenu\_socket\_broadcast\_by\_name
gnomenu\_socket\_shutdown
gnomenu\_socket\_destroy
gnomenu\_socket\_accept
gnomenu\_socket\_connect

GnomenuSocket::data-arrival
GnomenuSocket::connect-req
GnomenuSocket::connected
GnomenuSocket::shutdown

ACK = (ACK, source)
DATA = (DATA, source data\_bytes)
CONNECT\_ACK = (ACK, source, 0)
SHUTDOWN = (SHUTDOWN, source )
BROADCAST = (BROADCAST, source )

BROADCAST buffer is held in the receiver, _GNOMENU\_BROADCAST\_BUFFER
DATA buffer is held in the sender,_GNOMENU\_SEND\_BUFFER

Sender:
> + owns DATA buffer after it receives ACK and before it sends DATA
> + at the connection, before any _send is called.
> + holds a FIFO queue of data buffers for to be send data,
> + when a ACK or CONNECT\_ACK arrives:
> > if self->acks == 1; panic.
> > if queue is not empty, release a data from the queue(self->acks --)
> > else self->acks = 1.

> + when a_send is called:
> > push data to the queue.
> > if self->acks == 1 release a data from the queue.

Receiver:

> + sends CONNECT\_ACK when the connection is established.
> + owns DATA buffer after it receives DATA and before it sends ACK.
> + when receives DATA, emit data-arrival signal, send a ACK.