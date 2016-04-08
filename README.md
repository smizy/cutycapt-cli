# CutyCapt client on docker

- place ttf/otf file in current dir
- $ docker build -t cutycapt:centos .
- $ docker run -it --rm -v $(pwd):/code cutycapt:centos bash
- $ xvfb-run --server-args="-screen 0, 1024x768x24" CutyCapt --url=https://github.com --out=github.png 
- $ xvfb-run --server-args="-screen 0, 1024x768x24" CutyCapt --url=https://github.com --out=github.png --user-style-path=/code/custom.css

