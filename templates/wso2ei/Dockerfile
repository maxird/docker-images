FROM maxird/BASE_IMAGE:BASE_FROM_VERSION

ENV WSO2_VERSION=APP_VERSION
ENV WSO2_FOLDER=APP_FOLDER
ENV WSO2_CODE=APP_CODE

RUN cd /tmp && \
    wget \
        -q \
        --user-agent=testuser \
        --referer=https://wso2.com/integration/download-thank-you/ \
        https://product-dist.wso2.com/products/${WSO2_FOLDER}/${WSO2_VERSION}/wso2${WSO2_CODE}-${WSO2_VERSION}.zip && \
    cd /opt && \
    unzip -q /tmp/wso2${WSO2_CODE}-${WSO2_VERSION}.zip && \
    rm -f /tmp/wso2${WSO2_CODE}-${WSO2_VERSION}.zip && \
    echo 'done'

EXPOSE APP_EXPOSE
WORKDIR /opt/wso2${WSO2_CODE}-${WSO2_VERSION}/bin
CMD ["./APP_LAUNCH"]
