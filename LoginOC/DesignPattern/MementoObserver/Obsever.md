#  观察者模式

### 何为观察者模式

发布-订阅模型，Observer 从Subject 订阅通知。 ConcreteObserver 实现抽象Observer 并重载其update 方法，一旦Subject 的实例需要通知Observer任何新的变更，Subject就会发送update 消息来通知存储在内部列表中所有注册的Observer，Subject的内部状态可被取得并在以后进行处理

- 通知中心的抽象设计


### 何时使用
- 两种抽象类型相互依赖，将他们封装在各自的对象中，
- 对一个对象的改变需要同时改变其他对象，而不知道具体有多少对象有待改变
- 一个对象必须通知其他对象，而它又不需要知道其他对象是什么

### KVO 与通知中心
