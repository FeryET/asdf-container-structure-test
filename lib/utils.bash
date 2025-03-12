#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/GoogleContainerTools/container-structure-test"
TOOL_NAME="container-structure-test"
TOOL_TEST="container-structure-test version"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	list_github_tags
}

get_arch() {
	ARCH="$(uname -m)"
	if [ "$ARCH" = "x86_64" ]; then
		ARCH="amd64"
	fi
	if [ "$ARCH" = "aarch64" ]; then
		ARCH="arm64"
	fi
	echo "$ARCH"
}

get_os() {
	uname -s | tr '[:upper:]' '[:lower:]'
}

function to_comparable_version { echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; }

download_release() {
	local version filename url
	version="$1"
	filename="$2"
	# shellcheck disable=SC2046
	if [ $(to_comparable_version "$version") -ge $(to_comparable_version "v1.17.0") ]; then
		# From version 1.17.0 onwards the binaries are stored
		# in github releases
		BASE_URL="$GH_REPO/releases/download"
	else
		# versions before 1.17.0 should download from the legacy url
		BASE_URL="https://storage.googleapis.com/$TOOL_NAME"
	fi
	url="$BASE_URL/$version/$TOOL_NAME-$(get_os)-$(get_arch)"
	echo ""
	echo "---------------------"
	echo "*   Download info    "
	echo "---------------------"
	echo "	url: $url"
	echo "	tool: $TOOL_NAME"
	echo "	version: $version"
	echo "	downloaded_filename: $filename"
	echo "---------------------"
	echo ""
	echo "Download in progress..."
	curl -fsSL -o "$filename" "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d ' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
