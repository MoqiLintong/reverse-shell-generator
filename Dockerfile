FROM node:22-slim

# 安装 netlify cli
RUN npm config set registry https://registry.npmmirror.com/ \
    && npm install -g netlify-cli \
    && netlify version

# 创建工作目录
WORKDIR /usr/src/app

# 将项目文件打包进镜像
ADD . .

# 暴露应用端口
EXPOSE 8888

CMD ["netlify", "dev", "--context", "production"]
