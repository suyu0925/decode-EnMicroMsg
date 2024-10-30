# decode-micro-msg

解码微信加密数据库。

## 使用方法

镜像会将`/data/EnMicroMsg.db`解码为`/data/MicroMsg.db`。

使用时需要指定两个参数：
1. 目录`/data`: 需要挂载容器的`/data`目录。
2. 环境变量`DECODE_KEY`: 需要将密钥通过环境变量`DECODE_KEY`传入。

```sh
docker run --rm -v ${pwd}:/data -e DECODE_KEY=1234abc lckof/decode-micro-msg
```

## 开发

### Use buildx

```bash
docker buildx create --name mybuilder
docker buildx use mybuilder
docker buildx inspect --bootstrap
```

### Debug for single platform

```bash
docker buildx build --platform linux/amd64 -t decode-micro-msg --load .
docker run --rm -v ${pwd}:/data -e DECODE_KEY=1234abc decode-micro-msg
```

### Publish

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t lckof/decode-micro-msg --push .
```
