FROM debian:stable-slim
## 作者
LABEL maintainer="swust_ncgi@163.com"

##  debian 软件镜像库
COPY sources.list /etc/apt/sources.list

## debian 中文字体支持
RUN apt-get update
RUN apt-get install -y libfontconfig1
COPY fonts/* ./usr/share/fonts/
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


COPY phantomjs/bin/phantomjs /usr/local/bin
RUN chmod +x /usr/local/bin/phantomjs

# 创建工作目录
RUN mkdir -p /home/phantomjs/
WORKDIR /home/phantomjs/
ADD phantomjs/echartsconvert ./
EXPOSE 6666
CMD ["/usr/local/bin/phantomjs", "/home/phantomjs/echarts-convert.js", "-s", "-p", "6666"]

