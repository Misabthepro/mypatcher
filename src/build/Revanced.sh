#!/bin/bash
# Revanced build
source ./src/build/utils.sh
# Download requirements
revanced_dl(){
	dl_gh "revanced-patches revanced-cli" "revanced" "latest"
}
1() {
	revanced_dl
	get_apk "com.google.android.youtube" "youtube" "youtube" "google-inc/youtube/youtube" "Bundle_extract"
	# Patch YouTube Lite Arm64-v8a:
	get_patches_key "youtube-revanced"
	split_editor "youtube" "youtube-arm64-v8a" "include" "split_config.arm64_v8a split_config.en split_config.xxxhdpi"
	patch "youtube-arm64-v8a" "revanced"
}
2() {
	revanced_dl
    	# Patch Spotify:
    	# Download Spotify XAPK from APKPure
	url="https://d.apkpure.com/b/XAPK/com.spotify.music?version=latest"
    	req "$url" "spotify.apk"
    	# Extract XAPK
	#unzip "./download/spotify.xapk" -d "./download/spotify" > /dev/null 2>&1
	# Patch only arm64-v8a version
 	get_patches_key "spotify"
	#split_editor "spotify" "spotify-arm64-v8a"
	patch "spotify" "revanced"
 	# Patch with amoled version
 	get_patches_key "spotify-amoled"
  	patch "spotify" "amoled-revanced"
	revanced_dl
}
3() {
	revanced_dl
	# Patch Google photos:
	# Arm64-v8a
	get_patches_key "gphotos"
	get_apk "com.google.android.apps.photos" "gphotos-arm64-v8a" "photos" "google-inc/photos/google-photos" "arm64-v8a" "nodpi"
	patch "gphotos-arm64-v8a" "revanced"
}
4() {
	revanced_dl
	# Patch Duolingo
	get_patches_key "Duolingo"
	version="6.23.2" #https://github.com/ReVanced/revanced-patches/issues/4728#issuecomment-2779066581
	get_apk "com.duolingo" "duolingo" "duolingo" "duolingo/duolingo-duolingo/duolingo-language-lessons" "Bundle"
	patch "duolingo" "revanced"
}
5() {
	revanced_dl
	# Patch Google News Arm64-v8a
	get_patches_key "GoogleNews"
	get_apk "com.google.android.apps.magazines" "googlenews" "google-news" "google-inc/google-news/google-news" "Bundle_extract"
	split_editor "googlenews" "googlenews-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
	patch "googlenews-arm64-v8a" "revanced"
}
6() {
	revanced_dl
    	# Patch Spotify:
    	# Download Spotify XAPK from APKPure
	url="https://d.apkpure.com/b/XAPK/com.backdrops.wallpapers?version=latest"
    	req "$url" "backdrops.xapk"
    	# Extract XAPK
	unzip "./download/backdrops.xapk" -d "./download/backdrops" > /dev/null 2>&1
	# Patch only arm64-v8a version
 	get_patches_key "backdrops"
	split_editor "backdrops" "backdrops-arm64-v8a"
	patch "backdrops-arm64-v8a" "revanced"
}
#6() {
	#revanced_dl
	## Patch Instagram:
	## Arm64-v8a
	#get_patches_key "instagram"
	#version="370.1.0.43.96" #https://github.com/ReVanced/revanced-patches/issues/4584
	#get_apk "com.instagram.android" "instagram-arm64-v8a" "instagram-instagram" "instagram/instagram-instagram/instagram" "arm64-v8a" "nodpi"
	#patch "instagram-arm64-v8a" "revanced"
#}
case "$1" in
    1)
        1
        ;;
    2)
        2
        ;;
    3)
        3
        ;;
    4)
        4
        ;;
    5)
        5
        ;;
    6)
        6
        ;;
esac
