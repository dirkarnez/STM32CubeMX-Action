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

# make GCC_PATH="/home/ubuntu/gcc-arm-10.3-2021.07-x86_64-aarch64-none-elf/bin" && \

CMD cd /src/workspace && \
aarch64-none-elf-g++ --version && \
arm-none-eabi-gcc --version && \
echo $PATH && \
which aarch64-none-elf-g++ && \
which arm-none-eabi-gcc && \
cd STM32CubeMX-LED && \
make GCC_PATH="/home/ubuntu/gcc-arm-none-eabi-10.3-2021.10/bin" && \
cd build && \
zip --symlinks -r STM32CubeMX-LED-v1.0.0-gcc-arm-none-eabi-10.3-2021.10.zip . && \
exit
