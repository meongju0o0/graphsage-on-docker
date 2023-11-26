FROM python:3.11.6-bullseye

# Make graphsage directory
RUN cd /
RUN mkdir graphsage

COPY ./graphsage/* /graphsage

# Install Python libraries
RUN pip install pip==23.3.1 && \
    pip install torch==2.0.1 --index-url https://download.pytorch.org/whl/cpu && \
    pip install dgl==1.1.2 -f https://data.dgl.ai/wheels/repo.html && \
    pip install torchmetrics==0.11.4 ogb==1.3.6 requests==2.31.0

# Set Environment Variables
ENV PATH="${PATH}:/root/local/bin"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/root/local/lib"

CMD ["python3", "/graphsage/train_full.py", "--dataset", "cora"]
