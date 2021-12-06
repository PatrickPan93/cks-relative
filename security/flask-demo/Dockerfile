FROM python
RUN useradd python
RUN mkdir /data/www -p
COPY . /data/www
RUN chown -R python /data
RUN pip install flask -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install prometheus_client -i https://mirrors.aliyun.com/pypi/simple/
WORKDIR /data/www
USER python
CMD python main.py 
