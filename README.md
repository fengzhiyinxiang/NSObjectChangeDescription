# NSObjectChangeDescription
1. aop方式，直接引入项目。
2. hook以Model结尾的类的description方法，将原先不常用的内存地址log更改为遍历属性的log。
3. 这个hook使用更安全的方式是加上项目前缀，具体操作请修改非常简单的源码。
