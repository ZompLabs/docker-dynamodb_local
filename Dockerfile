FROM java:8-jre
MAINTAINER Zane Cahill <zcahill@zomp.net>

ENV DYNAMODB_LOCAL_VERSION latest
ENV DYNAMODB_LOCAL_HOME /opt/aws/dynamodb_local

RUN set -x \
  && mkdir -p ${DYNAMODB_LOCAL_HOME} \
  && curl -o dynamodb_local.tar.gz -L http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_${DYNAMODB_LOCAL_VERSION}.tar.gz \
  && tar -xzf dynamodb_local.tar.gz -C ${DYNAMODB_LOCAL_HOME} \
  && rm dynamodb_local.tar.gz

WORKDIR ${DYNAMODB_LOCAL_HOME}
ENTRYPOINT ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar"]

EXPOSE 8000
CMD ["-help"]
