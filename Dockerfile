FROM        python:3.7-slim
WORKDIR     /app
COPY        requirements.txt .
RUN         pip install -r requirements.txt
COPY        sidecar/sidecar.py .
ENV         PYTHONUNBUFFERED=1
# Grafana pod cannot start for SSL certificate verification when sidecar watched all configmap
# https://github.com/helm/charts/issues/11287
ENV         SKIP_TLS_VERIFY=true 
CMD         [ "python", "-u", "/app/sidecar.py" ]
