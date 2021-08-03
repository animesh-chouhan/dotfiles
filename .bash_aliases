# alias most used commands
alias ytdl="youtube-dl"
alias ytt="youtube_thumbnail"
alias playman="youtube-playman"

# mkdir + cd
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
