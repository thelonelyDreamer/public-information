### 1. 准备Mysql 环境

```yaml
version: '3.3'
services:
 mysql8:
  container_name: mysql8
  image: daocloud.io/library/mysql:8.0.19
  restart: always
  command:
   - --character-set-server=utf8mb4
   - --collation-server=utf8mb4_general_ci
   - --default-time_zone=+8:00
  environment:
   TZ: Asis/Shanghai
   MYSQL_ROOT_PASSWORD: ssdjkof344ADFV
   MYSQL_USER: wangchao
   MYSQL_PASSWORD: fkfojf23uQqsdf
  ports:
   - "3306:3306"
  volumes:
   - ./data/mysql:/var/lib/mysql
   - ./conf:/etc/mysql/conf.d

```

### 2. 启动连接

**错误代码2058**

```mysql
ALTER USER 'wangchao'@'%' IDENTIFIED WITH mysql_native_password BY 'fkfojf23uQqsdf';
```

### 3. 设置开发者账号

```mysql
CREATE USER 'developer'@'%' IDENTIFIED BY 'sfwef23sewesQWS';
ALTER USER 'developer'@'%' IDENTIFIED WITH mysql_native_password BY 'sfwef23sewesQWS';
GRANT ALL ON development.* TO developer;
```

