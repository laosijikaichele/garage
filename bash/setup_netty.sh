#!/bin/bash

# 遇到错误立即停止执行
set -e

echo "开始执行初始化脚本..."

# 1. 创建并进入目录
mkdir -p ~/git/netty
cd ~/git/netty

# 2. 更新系统并安装依赖库
echo "正在更新软件包并安装依赖..."
sudo apt update
sudo apt-get install -y autoconf automake libtool make tar libaio-dev libssl-dev libapr1-dev lksctp-tools

# 3. 克隆仓库
if [ ! -d "netty_repo" ]; then
    echo "正在克隆 Netty 仓库..."
    # 注意：这里原命令克隆到当前目录，为了防止文件夹重名冲突，可以指定目录或直接在当前运行
    git clone https://github.com/laosijikaichele/netty.git .
else
    echo "仓库已存在，跳过克隆。"
fi

# 4. 安装 Maven
echo "正在安装 Maven..."
sudo apt install -y maven

# 5. 安装 Netdata (静默安装)
echo "正在安装 Netdata..."
wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && \
sh /tmp/netdata-kickstart.sh --non-interactive --no-updates --disable-telemetry

echo "所有任务执行完毕！"
