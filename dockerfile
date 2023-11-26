FROM python:3.11.6-bullseye

COPY ./graphsage/* /graphsage

# Install Python libraries
RUN pip install pip==23.3.1 && \
    torch==2.0.1 --index-url https://download.pytorch.org/whl/cpu \
    torchmetrics==0.11.4 \
    dgl==1.1.2 -f https://data.dgl.ai/wheels/repo.html \
    ogb==1.3.6 requests==2.31.0

# Change directory to workspace
RUN cd /graphsage

# Set Environment Variables
ENV PATH="${PATH}:/root/local/bin"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/root/local/lib"

CMD ["python3", "train_full.py", "--dataset", "cora", \
    "--gpu",]
