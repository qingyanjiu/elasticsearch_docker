FROM java:8
USER root
RUN useradd -p "Lgo93Po7Bjk3." es
RUN apt-get update -y
RUN apt-get install -y wget
WORKDIR /home/es
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.3.zip
RUN unzip elasticsearch-5.6.3.zip
WORKDIR /home/es/elasticsearch-5.6.3
ADD ./elasticsearch.yml config/elasticsearch.yml
RUN ./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v5.6.3/elasticsearch-analysis-ik-5.6.3.zip
RUN chown -R es /home/es/elasticsearch-5.6.3
EXPOSE 9200
USER es
CMD bash -c ./bin/elasticsearch
