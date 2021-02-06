#~/bin/csh

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


# change the top testbench file name 
set TB_TOP=TOP_tb.v




# PLI for vcs
set PLATFORM=linux64
set NOVAS_HOME=/opt/synopsys/verdi_2015_09
export LD_LIBRARY_PATH=/opt/synopsys/verdi_2015_09/share/PLI/lib/linux64:${LD_LIBRARY_PATH}

vcs -full64 TOP_tb.v writeback.v -y /home/Huangzy/VCS_space/CPU/source/ -v /home/Huangzy/VCS_space/CPU/source/ +libext+.v \
-debug_all \
-l comp.log \
 -P /opt/synopsys/verdi_2015_09/share/PLI/VCS/linux64/novas.tab \
    /opt/synopsys/verdi_2015_09//share/PLI/VCS/linux64/pli.a \



./simv -l simv.log 

verdi -v -f \
./sim/*.v \
./rtl/*.v \
-ssf wave.fsdb 




