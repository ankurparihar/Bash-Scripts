# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

PROMPT_DIRTRIM=1
# SSLKEYLOGFILE=$HOME/Desktop/CSN_PROJ/sslkeylog.log
encrypt(){
	openssl enc -aes-256-cbc -pass pass:password -md sha256 -p -a -in "$1" -out "$1.enc";
	mv "$1.enc" "$1";
}
decrypt(){
	openssl enc -d -aes-256-cbc -pass pass:password -md sha256 -p -a -in "$1" -out "$1.dec";
	mv "$1.dec" "$1";
}

branch_enc(){
	diff <(git ls-tree -r --name-only $1) <(git ls-tree -r --name-only encrypted) | grep "[<>]" | cut -c 3- > list.txt;
	cat list.txt | while read file; do git checkout $2 "$file"; done;
	cat list.txt | while read file; do encrypt "$file"; done;
	rm list.txt;
	git add -A;
	git status;
	git commit -m "$3";
	git log --oneline;
}
