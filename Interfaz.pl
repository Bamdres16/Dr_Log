:- use_module(library(pce)).
t0:-new(D,dialog('DrLog')),send(D,open).
t2:- new(D,dialog('Sistema Experto DrLog')),
    send(D,append, editor(drlog,'dummy')),
    send(D,open).
