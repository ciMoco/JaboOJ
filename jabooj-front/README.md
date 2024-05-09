### 根据后端生成接口
openapi --input http://localhost:8121/api/v2/api-docs --output ./backapi --client axios

### 安装
```shell
yarn install
```

### 启动

```shell
yarn run serve
```