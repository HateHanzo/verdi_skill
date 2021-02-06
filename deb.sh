#!/bin/bash

verdi -v -f \
./*.v \
../rtl/*.v \
-ssf wave.fsdb &




