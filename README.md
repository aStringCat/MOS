# MOS

BUAA OS课程2024春季学期操作系统MOS代码

## Docker 运行

### 1. 构建镜像
```bash
docker build -t mos .
```
这一步会根据当前目录里的 Dockerfile 生成一个名为 `mos` 的镜像，并把编译 MOS 需要的工具链、QEMU、GDB 等环境安装进去。

### 2. 启动容器并挂载当前项目目录
```bash
docker run --rm -it -v "$PWD":/work mos
```
这一步会启动一个容器，并把当前宿主机目录挂载到容器里的 `/work`。
其中 `-v "$PWD":/work` 的意思是把当前目录映射到容器内的 `/work`，容器里对 `/work` 的读写会直接作用到本地项目目录。

### 3. 在容器里编译或运行
```bash
make
make run
```
这一步会在容器内使用已经配置好的交叉编译工具链编译 MOS，并通过 QEMU 启动内核。

### 4. 运行测试
```bash
make test lab=2_1 && make run
```
这一步会先切换到对应的测试目录生成测试文件，再编译内核，最后启动 QEMU 运行测试。

### 5. 退出容器
```bash
exit
```
或者按 `Ctrl+D`。

## 常见说明

- `-v "$PWD":/work`：挂载当前项目目录到容器内的 `/work`
- `WORKDIR /work`：容器启动后默认进入 `/work`
- `QEMU_ROM_PATH=...`：让 QEMU 能找到需要的 ROM 文件
- `--rm`：容器退出后自动删除容器本身，但不会删除本地项目文件
