#!/usr/bin/env python

def tobytes(xs):
    return b''.join(chr(x) if isinstance(x, int) else x for x in xs)
