FROM kalilinux/kali-rolling:latest

RUN apt-get update && \
    apt-get install -y git python3-pip figlet sudo boxes php curl xdotool wget lolcat && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /root/hackingtool

COPY requirements.txt ./
RUN cat requirements.txt
RUN pip3 install --no-cache-dir --break-system-packages -r requirements.txt

COPY . .
RUN echo "/root/hackingtool/" > /home/hackingtoolpath.txt

EXPOSE 1-65535

ENTRYPOINT ["python3", "/root/hackingtool/hackingtool.py"]
