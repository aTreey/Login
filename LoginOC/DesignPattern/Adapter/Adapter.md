
#  适配器模式

### 何为适配器模式

用于连接两种不同种类的对象，主要是把适配者的行为传递给管道另一端的客户端。

- 类适配器：首先有需要定义了客户端要使用的一套行为的协议，然后要用具体的适配器类来实现这个协议。适配器类同时也要继承被适配者，类Adapter 是一个接口类型，同时也是一个被适配者l类型，Adapter重载协议的方法
- 对象Adapter：不继承被适配者，而是组合了一个对它的引用。Adapter 和Adaptee 之间的关系从“属于”变成了“包含”。Adapter 需要保持一个对Adaptee 的引用


### 何时使用
- 已有累的接口和需求不匹配
- 想要一个可复用的类，该类能够同时可能带有不兼容接口的其他类协作
- 需要适配一个类的几个不同子类，可是让每一个子类去子类化一个类适配器有不现实，可使用对象适配器（也叫委托）来适配其父类的接口
