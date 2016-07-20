FROM python:3.5

ENV http_proxy http://proxy-us.intel.com:911
ENV https_proxy http://proxy-us.intel.com:911
ENV ftp_proxy http://proxy-us.intel.com:911
ENV socks_proxy http://proxy-us.intel.com:1080
ENV no_proxy intel.com,.intel.com,10.0.0.0/8,192.168.0.0/16,localhost,127.0.0.0/8,134.134.0.0/16

RUN pip install --upgrade pip
RUN pip install Flask==0.10.1 uWSGI==2.0.8 requests==2.5.1 redis==2.10.3
WORKDIR /app
COPY app /app
COPY cmd.sh /
COPY set_proxies /
COPY unset_proxies /

ENV http_proxy ""
ENV https_proxy ""
ENV ftp_proxy ""
ENV socks_proxy ""
ENV no_proxy ""

CMD ["sh", "/cmd.sh"]
