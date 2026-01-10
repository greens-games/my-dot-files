if [[ $1 == arch ]]; then
	package_manager="pacman"
	install="-S"
	check_remote="-Ss"
	check_local="-Q"
fi

if [[ $1 == fedora ]]; then
	package_manager="dnf"
	install="install"
	check_remote="search"
	check_local="-Q"
fi

get() {
	sudo $package_manager $check_remote ^$1$
	if [[ $? == 0 ]]; then
		echo "Installing $1"
		sudo $package_manager $install $1 2> logs.txt
	else
		echo $1 >> failed_packages.txt
	fi
}

env_check() {
	[ -f $1 ]
	if [[ $? == 0 ]]; then
		rm $1
		touch $1
	fi
}

env_check logs.txt
env_check failed_packages.txt

get ksnip
get nvim
get alacritty
get feh
get i3
get i3blocks
echo "installing Obsidian"
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.10.6/Obsidian-1.10.6.AppImage
echo "installing Brave"
curl -fsS https://dl.brave.com/install.sh | sh
echo "generating ssh key"
ssh-keygen -t ed25519 -C "mgreen72194@gmail.com"
