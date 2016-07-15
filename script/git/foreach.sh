for REPO in `ls -d */`; do (cd "$REPO";echo "\n=====================| $REPO |====================\n"; git $1); done;
