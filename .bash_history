SESSION_NAME=Strigo
CONF_FILE=~/.tmux.conf
cat >/tmp/strigo-instance-prepare.sh <<PREPARE
if ! which tmux; then
echo Installing tmux

if which apt-get; then
  echo Installing with apt-get
  sudo -n apt-get update
  sudo -n env DEBIAN_FRONTEND=noninteractive apt-get install -y tmux
fi

if which dnf; then
  echo Installing with dnf
  sudo -n dnf install -y tmux
fi

if which yum; then
  echo Installing with yum
  sudo -n yum install -y tmux
fi
fi

if [[ ! -f "$CONF_FILE" ]]; then
(
  echo "set -g status off"
  echo "set -g pane-border-fg colour237"
  echo "set -g pane-active-border-fg colour239"
) > "$CONF_FILE"
fi
PREPARE

cat <<BOOTSTRAP > /var/tmp/bootstrap.sh
#!/bin/bash -eu

export TERM=screen-256color

while true; do
if tmux has-session -t "$SESSION_NAME"; then
  tmux attach -t "$SESSION_NAME"
else
  tmux new-session -s "$SESSION_NAME"
fi
echo "You have exited your shell."
echo "Press enter to return to the shell."
read
done
BOOTSTRAP

/bin/bash /tmp/strigo-instance-prepare.sh
exit
