#!/bin/bash

if [ -e wave.fsdb ] 
then
rm wave.fsdb
fi

if [ -d simv.daidir ]
 then
rm -r simv.daidir
fi

if [ -e simv ]
 then
rm simv
fi


# PLI for vcs
export PLATFORM=LINUX
export NOVAS_HOME=/usr/synopsys/Verdi/verdi_2010.10
export LD_LIBRARY_PATH=/usr/synopsys/Verdi/verdi_2010.10/share/PLI/lib/LINUX:${LD_LIBRARY_PATH}

vcs asyn_fifo_tb.v -v2005 -y ../rtl/ +libext+.v \
-debug_all \
-l comp.log \
 -P /usr/synopsys/Verdi/verdi_2010.10/share/PLI/VCS/LINUX/novas.tab \
    /usr/synopsys/Verdi/verdi_2010.10/share/PLI/VCS/LINUX/pli.a \



./simv -l simv.log 


#verdi -v -f \
#./*.v \
#../rtl/*.v \
#-ssf wave.fsdb &




