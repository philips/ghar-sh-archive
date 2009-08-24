# ghar bash completion
#
# Copyright (C) 2009 Brandon Philips <brandon@ifup.org>
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.


_ghar() {
        GHAR_CMDLIST=()
	GHAR="$(type -p ghar)"

	local -a opts=()
	local -i ITER=0
	local IFS=$'\n'

	if test ${#GHAR_CMDLIST[@]} -eq 0; then
		GHAR_CMDLIST=($(LC_ALL=POSIX $GHAR | \
				sed -rn '/^Commands:/,$ {
					s/^[[:blank:]]*//
					s/^[[:upper:]].*//
					s/[[:blank:]]+-[[:blank:]]+.*$//
					/^$/d
					p
				}'))
	fi

	if test $COMP_CWORD -lt 1 ; then
		let COMP_CWORD=${#COMP_WORDS[@]}
	fi
        cur=${COMP_WORDS[COMP_CWORD]}

	let ITER=COMP_CWORD
	while test $((ITER--)) -ge 0 ; do
		comp="${COMP_WORDS[ITER]}"
		if [[ "${GHAR_CMDLIST[@]}" =~ "${comp}" ]]; then
			command=${COMP_WORDS[ITER]}
			break;
		fi
		if [[ "${comp}" =~ "ghar" ]]; then
			command="ghar"
			break;
		fi
	done
	
	if [[ "$command" =~ "ghar" ]]; then
		opts=(${GHAR_CMDLIST[*]})
		COMPREPLY=($(compgen -W "${opts[*]}" -- ${cur}))
		eval $noglob
		return 0;
	fi
}

complete -F _ghar -o default ghar
