
export PATH=${PATH}:$HOME/local/bin:$HOME/bin:/opt/rational/clearcase/bin:/opt/rational/clearcase/etc:/usr/sbin:/usr/bin:/usr/local/bin:/opt/rational/clearquest/bin:.
PATH=$PATH:"/home/jquis/todotxt"
export TODOTXT_DEFAULT_ACTION=ls
export LC_ALL=en_US.utf8
export LANG=en_US.utf8
export LANGUAGE=en_US.utf8
CSCOPE_DB=$HOME/projects/sc/cscope.out; export CSCOPE_DB

HOST=`hostname`
#export PS1='
#[01;35m${USER}[01;36m@[1;35m${HOST%%.*} [01;36m>> [01;32m${PWD} 
#[01;36m[!]->[0m '
export PS1='
[01;35m${USER}[01;36m@[1;35m${HOST%%.*}:/[01;32m${PWD} 
[01;36m>[0m '

#settings
set -o vi
echo ".kshrc $0"
export EDITOR=vim

# Aliases
if [ -n "$KSH_VERSION" ]
	then # ksh93
		export EXTENDED_HISTORY=ON                           # AIX-5.3 ksh datestamp in ksh history.
		export HISTFILE="$HOME/.ksh_history"                 # Default is ~/.sh_history.
		export HISTSIZE=${HISTSIZE:-"2000"}                  # Lines of command history logged.
		export HISTEDIT=${HISTEDIT:-"$VISUAL"}               # History editor ; replaces obsolete var FCEDIT.
		export XTERM=xterm

		# check for GNU ls (colorful list)
		ls --version 3> /dev/null | grep GNU >/dev/null 2>&1 && export LS_COLOUR="--color=auto"

		# check for human readable ( -h )
		ls -h /dev/null 2> /dev/null 1>&2 && H='-h'

		alias l.='ls -lAdF ${H} ${LS_COLOUR} --group-directories-first .*'    # list only hidden things
		alias la='ls -lAF ${H} ${LS_COLOUR} --group-directories-first'        # list all
		alias ll='ls -lF ${H} ${LS_COLOUR} --group-directories-first'         # list long
		alias ls='ls -F ${LS_COLOUR} --group-directories-first'               # list with flags

	else # ksh88 or Posix
		alias ls='ls -CF'
		export HISTFILE="$HOME/.sh_history"                  # Default is ~/.sh_history.
		export HISTSIZE=${HISTSIZE:-"2000"}                  # Lines of command history logged.
		export HISTEDIT=${HISTEDIT:-"$VISUAL"}               # History editor ; replaces obsolete var FCEDIT.
fi



## GNU grep, if available, has colorized output.
grep --version 2> /dev/null | grep GNU >/dev/null 2>&1 && alias grep='grep --color=always'



#alias \!\!='fc -e -'
alias ct=cleartool
alias mt=multitool
alias vxman='man -M /opt/windriver/vxworks-cert-6.6.3/man'
alias wb=/opt/windriver/startWorkbench.sh
alias sc='cd /home/eekbe/SC_PROJECT/source'
alias resetsc1='/home/eekbe/scripts/resetsc.exp 1'
alias resetsc2='/home/eekbe/scripts/resetsc.exp 2'
alias resetsc3='/home/eekbe/scripts/resetsc.exp 3'
alias resetsc4='/home/eekbe/scripts/resetsc.exp 4'
alias resetsc5='/home/eekbe/scripts/resetsc.exp 5'
alias resetsc='/home/eekbe/scripts/resetsc.exp'
alias poweroffsc='/home/eekbe/poweroffsc.exp'
alias poweronsc='/home/eekbe/poweronsc.exp'

alias telnetsc0sp1='telnet termserv-r13 10021'
alias telnetsc0sp2='telnet termserv-r13 10022'

alias telnetsc1sp1='telnet termserv-r13 10001'
alias telnetsc1sp2='telnet termserv-r13 10002'
alias telnetsc1sp1_fp='telnet termserv-r13 10003'
alias telnetsc1sp2_fp='telnet termserv-r13 10004'

alias telnetsc2sp1='telnet termserv-r13 10005'
alias telnetsc2sp2='telnet termserv-r13 10006'
alias telnetsc2sp1_fp='telnet termserv-r13 10007'
alias telnetsc2sp2_fp='telnet termserv-r13 10008'

alias telnetsc3sp1='telnet termserv-r13 10009'
alias telnetsc3sp2='telnet termserv-r13 10010'
alias telnetsc3sp1_fp='telnet termserv-r13 10011'
alias telnetsc3sp2_fp='telnet termserv-r13 10012'

alias telnetsc4sp1='telnet termserv-r13 10013'
alias telnetsc4sp2='telnet termserv-r13 10014'
alias telnetsc4sp1_fp='telnet termserv-r13 10015'
alias telnetsc4sp2_fp='telnet termserv-r13 10016'

alias telnetsc5sp1='telnet termserv-r13 10017'
alias telnetsc5sp2='telnet termserv-r13 10018'
alias telnetsc5sp1_fp='telnet termserv-r13 10019'
alias telnetsc5sp2_fp='telnet termserv-r13 10020'
#alias ls='ls --color=auto --group-directories-first'
#alias la='ls -a'
#alias ll='ls -la'
#alias l.='ls -d .*'
alias ..='cd ..;ls'
alias ...='cd ../..;ls'
alias ....='cd ../../..;ls'
alias rm='rm -I'
alias mv='mv -i'
alias t='todo.sh -d /home/jquis/todotxt/todo.cfg'
alias rngr='/home/jquis/ranger/ranger-1.6.1/ranger.py'
#alias tmux='/home/jquis/local/bin/tmux-1.9a'
alias objdumpppc='/opt/windriver/gnu/4.1.2-vxworks-6.6/x86-linux2/bin/objdumpppc'
#source todo_completion
#source /home/jquis/todotxt/todo_completion


#complete -F _todo t
make()
{
	#pathpat="(/[^/]*)+:[0-9]+"
	#pathpat="(/[^/]*)+:[0-9]+"
	#ccred=$(echo -e "\033[0;31m")
	#ccyellow=$(echo -e "\033[0;33m")
	C_ERR=`echo -e "\033[38;5;124m"`
	C_WRN=`echo -e "\033[38;5;227m"`
	#C_SRC=`echo -e "\033[38;5;46m"`
	C_SRC=`echo -e "\033[38;5;118m"`
	#C_OBJ=`echo -e "\033[38;5;39m"`
	C_OBJ=`echo -e "\033[38;5;51m"`
	C_LIN=`echo -e "\033[38;5;99m"`
	C_HEX=`echo -e "\033[38;5;99m"`
	C_NON=`echo -e "\033[0m"`
	P_ERR="[Ee]rror.*:.*$"
	P_WRN="[Ww]arning.*:.*$"
	P_SRC="\b[_a-zA-Z0-9/-]*\.c\b"
	P_OBJ="\b[_a-zA-Z0-9/-]*\.o\b"
	P_LIN="line.*[0-9]*"
	P_HEX="(0x)?[0-9a-fA-F]{8}"
	#/usr/bin/make "$@" 2>&1 | sed -E -e "/[Ee]rror[: ]/ s%$pathpat%$ccred&$ccend%g" -e "/[Ww]arning[: ]/ s%$pathpat%$ccyellow&$ccend%g"
	/usr/bin/make "$@" 2>&1 | sed -E \
		-e "s/${P_SRC}/${C_SRC}&${C_NON}/g" \
		-e "s/${P_OBJ}/${C_OBJ}&${C_NON}/g" \
		-e "s/${P_LIN}/${C_LIN}&${C_NON}/" \
		-e "s/${P_ERR}/${C_ERR}&${C_NON}/" \
		-e "s/${P_WRN}/${C_WRN}&${C_NON}/" \
		-e "s/${P_HEX}/${C_HEX}&${C_NON}/g"
	return ${PIPESTATUS[0]}
}

alias sigs='cd /cat/onmdata/ESHADOW1/REPORTS'
alias sig_his='curl -u waasfaa:amc189 http://waas.faa.gov/ess/performance/PERFMON/history/enh_shadow1/system_status/Sig_events_history.txt > ~/tmp_sigevn_hist.txt && vim ~/tmp_sigevn_hist.txt'
alias sig_today='curl -u waasfaa:amc189 http://waas.faa.gov/ess/performance/PERFMON/curr/enh_shadow1/system_status/Sig_events_curr.txt'
alias std='curl -u waasfaa:amc189 http://waas.faa.gov/ess/performance/PERFMON/curr/enh_shadow1/system_status/Sig_events_curr.txt > ~/tmp_sigevn_today.txt && cat ~/tmp_sigevn_today.txt'
alias vstd='curl -u waasfaa:amc189 http://waas.faa.gov/ess/performance/PERFMON/curr/enh_shadow1/system_status/Sig_events_curr.txt > ~/tmp_sigevn_today.txt && vim ~/tmp_sigevn_today.txt'
#alias std_bre='awk '{c="\033[0m"} $3 ~ /NEW/ {c="\033[01;33m"} /Mode change/ {c="\033[01;36m"} $3 ~ /RES/ {c="\033[0;32m"} /BRE/ {print c $0 "\033[0m"} NR<5 {print "\033[1;37m" $0 "\033[0m"}' tmp_sigevn_today.txt'
