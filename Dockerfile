FROM armswdev/arm-tools:bare-metal-compilers

RUN sudo rm /var/lib/apt/lists/lock && \
sudo apt-get update -y && \
sudo apt-get upgrade -y && \
sudo apt-get -y --no-install-recommends install \
zip \
unzip \
gcc  \ 
python3  \
libpng-dev  \
ruby-full  \
gcovr  
 
RUN sudo mkdir -p /src/workspace

VOLUME /src/workspace

CMD cd /src/workspace && \
aarch64-none-elf-g++ --version && \
cd STM32CubeMX-LED && \
make GCC_PATH="/home/ubuntu/AC6/bin" && \
cd build && \
zip --symlinks -r STM32CubeMX-LED-v1.0.0-gcc-arm-10.3-2021.07-x86_64-aarch64-none-elf.zip . && \
exit
