#!/bin/bash

noip2 -C -u $USERNAME -p $PASSWORD -U $INVERVAL
noip2
/bin/bash -c "trap : TERM INT; sleep infinity & wait"