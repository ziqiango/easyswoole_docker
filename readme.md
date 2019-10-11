# 使用步骤



## 一、创建项目目录

```bash

mkdir  easyswoole (名字自己起)

```

## 二、复制解压后的easyswoole_docker文件夹重命名为docker

```bash

mv easyswoole_docker docker


```

## 三、移动 docker文件夹 到 项目目录

```bash

mv docker easyswoole

```

## 三、第一次 进行docker build

```bash

cd docker

    ## 名字可以自定义  同时修改docker/container.sh 中的IMAGE_NAME

docker build -t zhuzq:v3.3.0  .

```


## 四、启动  运行docker/container.sh 确保有运行权限

```

cd 项目目录

### 1. 启动

docker/container.sh

### 访问 测试

curl http://127.0.0.1:9501

### 2. 重启

docker/container.sh restart

### 3. 关闭
docker/container.sh stop

### 4. 进入容器bash

docker/container.sh shell


```

