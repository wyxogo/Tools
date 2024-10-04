Linux CLI: 
```cardlink
url: https://github.com/mzz2017/gg/tree/main
title: "GitHub - mzz2017/gg: 一个支持节点与订阅链接的 Linux 命令行代理工具 | A command-line tool for one-click proxy in your research and development without installing v2ray or anything else (only for linux)"
description: "一个支持节点与订阅链接的 Linux 命令行代理工具 | A command-line tool for one-click proxy in your research and development without installing v2ray or anything else (only for linux) - mzz2017/gg"
host: github.com
favicon: https://github.githubassets.com/favicons/favicon.svg
image: https://opengraph.githubassets.com/65b2111d259e78c22e5074d2edfd7b4fe2826c446282709af6ba0d9481b0af1a/mzz2017/gg
```
# Download

## OneDrive
```shell
mkdir gg
cd gg
wget 'https://weiijw.ph.files.1drv.com/y4mat8dGakZh0i2D26PK-Tpft0qGYVBXW4asfWb3eBEcSg4qTyp-SyrRxZZBYRDxSjriQqVv6z6k4OD6IQDLXi6UUAmSPqjOaKOyy4Es_y16HEZO7X0LoV0-ac7CUB1h5pRcdfagfgGqV--Cr2-suPhbhCG5sr5Bu1hoKtbY5rcObwNtpZe-cWbg6Z1NzrEpfx30jx08wPtnQg4Zk_dyZNJ_g' -O gg-linux-x86_64
wget 'https://weijjw.ph.files.1drv.com/y4mwduKWIACURtjNK4Ia6VGsuE2ZMsBpnU0DxyDu6GigWIRlSWCYI8CQxjueLpDAv1pyC5kc5DwORvGbzhf0Ebw8khgIxuaKWWD6My102pLaxZySy9pKPXwZoSqltNAk5Me5NRnkHlsJYkEomAT5Z-YHa5boVw5zpVqaG9XgxSlUVgcatAyvkLezG1jm3r2_FC7bJTQwDwFyRIprL9Csjdf0Q' -O go.sh
sudo sh ./go.sh
```

## ECS
```shell
scp -r yasin@47.116.189.84:~/gg ./
cd gg
sudo sh ./go.sh
```
## Official
```shell
curl -L https://github.com/mzz2017/gg/raw/main/release/go.sh | sed '79s|curl -L "https://github.com/mzz2017/gg/releases/latest/download/gg-${PLATFORM}-${ARCH}" -o "${temp_file}"|cp ./gg-linux-x86_64 ${temp_file}|' | sudo sh
```

```shell
sudo sh -c "$(curl -L https://github.com/mzz2017/gg/raw/main/release/go.sh)"
```
## Config
```shell
gg config -w subscription='https://api.dler.io/sub?target=clash&url=vmess%3A%2F%2FewogICJ2IjogIjIiLAogICJwcyI6ICJ3eXgiLAogICJhZGQiOiAieHh4Lm1vbm93eHkud2luIiwKICAicG9ydCI6IDMxNjA5LAogICJpZCI6ICIyZjFmMGM1MS1kODg4LTRlZGQtODExYi1hODc4OGE0Y2YzODIiLAogICJzY3kiOiAiYXV0byIsCiAgIm5ldCI6ICJ3cyIsCiAgInR5cGUiOiAibm9uZSIsCiAgInRscyI6ICJ0bHMiLAogICJwYXRoIjogIi83NWRiYzliOSIsCiAgImhvc3QiOiAiIgp9&insert=false&config=https%3A%2F%2Fraw.githubusercontent.com%2FACL4SSR%2FACL4SSR%2Fmaster%2FClash%2Fconfig%2FACL4SSR_Online.ini'
```

```shell
gg config -w node=vmess://ewogICJ2IjogIjIiLAogICJwcyI6ICJ3eXgiLAogICJhZGQiOiAieHh4Lm1vbm93eHkud2luIiwKICAicG9ydCI6IDMxNjA5LAogICJpZCI6ICIyZjFmMGM1MS1kODg4LTRlZGQtODExYi1hODc4OGE0Y2YzODIiLAogICJzY3kiOiAiYXV0byIsCiAgIm5ldCI6ICJ3cyIsCiAgInR5cGUiOiAibm9uZSIsCiAgInRscyI6ICJ0bHMiLAogICJwYXRoIjogIi83NWRiYzliOSIsCiAgImhvc3QiOiAiIgp9
```

```shell
gg config -u node
```