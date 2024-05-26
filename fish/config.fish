if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch
end

set fish_greeting ""
export ANDROID_HOME="$HOME/Android/Sdk/"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/build-tools:$PATH"
export PATH="/home/abhi/.local/bin:$PATH"
export DENO_INSTALL="/home/abhi/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
