#  桥接模式

### 目的
把抽象层次结构从其实现中分离出来，使其能够独立变更。
抽象层定义了供客户端使用的上层的抽象接口。
实现层结构定义了供抽象层使用的底层接口
实现类的引用被封装与抽象层的实例中时，桥接模式就形成了

### 何时使用
- 不想在抽象与其实现之间形成固定的绑定关系的（这样就能在运行时切换实现）
- 抽象及其实现都应可以通过子类化独立进行扩展
- 对抽象的实现代码修改不应该影响客户端代码
- 如果每个实现需要额外的子类以细化抽象，则说明有必要把它们分为两个部分
- 想在带有不同抽象接口的多个对象之间共享一个实现
