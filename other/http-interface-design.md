# HTTP接口设计

## 文档规范

1. 需要接口文档
   * uri
   * method
   * 说明/备注
2. 需要入参，出参， 是否必传
3. 需要注释
4. 需要返回值示例

## 参数命名规范

1. json字段命名全部采用驼峰
2. 必须使用正确的英文单词

## Request规范

1. token放在header中
2. 接口安全
3. 基参数放在header中

## Response 规范

1. 需要抽象返回结构, 需要状态码表

   ```javascript
   {
       "code": "0",  //业务码
       "msg": "error msg"
       "data": []/{}
   }
   ```

2. 分页

   ```javascript
   {
       "code": "0",  //业务码
       "msg": "error msg",
       "data": {
           "total": 1,
           "totalPage": 1,
           "pageSize": 1,
           "pageNum": 1,
           "content": []
       }
   }
   ```

3. 错误信息

   报错时需要传错误信息

4. 没有值的字段，由于NULL 的判断问题
   * 要么不返回
   * 要么创建好对象返回
5. 相同结构的参数和命名要一致

## 接口升级

1. 直接升级url，在url中添加版本，而不是修改参数，直观，不容易出错

