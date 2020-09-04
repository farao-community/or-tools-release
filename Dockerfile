FROM fedora:31

RUN dnf -y groupinstall "Development Tools"
RUN dnf -y install cmake g++ swig java-1.8.0-openjdk-devel maven
RUN git clone https://github.com/farao-community/or-tools.git
WORKDIR /or-tools
COPY private.key private.key
COPY maven_settings.xml /root/.m2/settings.xml
COPY release.patch release.patch
RUN patch -p0 < release.patch
RUN cmake -DBUILD_DEPS=ON -DBUILD_JAVA=ON .
COPY signing_script.sh signing_script.sh
RUN chmod +x signing_script.sh

CMD ["./signing_script.sh"]
