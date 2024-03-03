# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi


alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ll='ls -lah'


# alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'


alias dlf-firefox='ssh -ND 9090 silver'
alias dlf-mount='sshfs -o follow_symlinks dlfserver:/mnt/dlf/bestuur ~/bestuursbestanden'
alias dlf-umount='sudo umount ~/bestuursbestanden'



