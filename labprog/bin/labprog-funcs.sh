if  [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo 'this script must be sourced, not executed' 2>&1
    exit 1
fi

up_tm() {
    cur=$(pwd -P)
    while [ ! -z $cur ] && [ ! -x "$cur/.tm" ]; do
        cur=${cur%/*}
    done
    if [ -x "$cur/.tm" ]; then
        "$cur/.tm" "$@"
    else
        echo "${0##*/}: errore: posizionarsi in una sottodirectori di '$HOME/labprog'..." 2>&1
        return
    fi
}
export -f up_tm
