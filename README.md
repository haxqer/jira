# jira

All code and docs by [xsharp](https://github.com/xsharp).

---

## 容器环境

假定你已经了解 Docker 容器相关基础知识。

### Debian / CentOS 中安装
- https://docs.docker.com/engine/install/debian/
- https://docs.docker.com/engine/install/centos/

### 网络环境（可能需要关注）

#### 代理设置
注意：需要正常的网络环境，默认从 Docker Hub 拉取镜像。

不能访问 Docker Hub 时可能需要设置下面两种代理：
- `docker pull` 代理
- `docker build` 代理，这个在 `docker/.env` 中配置 `HTTP_PROXY` / `HTTPS_PROXY`

代理设置可以看这个文档（没有验证）：https://cloud.tencent.com/developer/article/1806455

当然，你也可以在网关设备上设置自动科学上网，这样就可以绕开代理设置的麻烦。

#### 使用镜像或私有仓库
如果使用 Harbor 等私有 / 缓存镜像仓库，可以设置 `docker/.env` 中 `IMAGE_PREFIX` 参数，注意末尾的 `/`。

## 容器启动
检出或解压后，进入项目目录，已经测试过 Debian / CentOS / Windows，理论上其他 Docker X86 系统都支持。
- 在 Debian / CentOS 上执行：
    ```
    ./build.sh
    ```
- 打开浏览器执行安装向导：`http://YOU_SERVER_IP:8080/`，进入到输入许可时看下面的步骤；
- 执行 `./keygen.sh` 生成 Jira 许可，拷贝许可部分到上述页面中；
- 如果需要将 Jira 运行在一个 Proxy（如：nginx）后面，需要设置`docker/docker-compose.yml` 及 `docker/.env` 中的 `ATL_` 前缀相关配置。
- 如果要升级 Jira 至更新版本，三个步骤：
    ```
    # 停止并清理 Docker 容器，该命令不会删除本地数据
    ./cleanup.sh
    # 修改 docker/.env 中的版本号
    vi ./docker/.env
    # 再次执行下面命令：
    ./build.sh
    ```

## FAQ：
如何生成 **Atlassian Marketplace for JIRA** 上安装的插件的许可？
```
./keygen.sh -p 插件名
````
