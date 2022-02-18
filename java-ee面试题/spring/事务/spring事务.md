### 1. spring事务回滚机制

总：spring 事务是由aop实现的，首先要生成具体的代理对象，然后按照aop的整套流程来具体的逻辑操作，正常情况下是通过Before/After/AfterThrowing来实现的。但是事务不是通过通知来实现的，二十通过TransactionInterceptor来实现的，然后调用invoke来实现具体的逻辑。

分： 1.先做准备工作，解析各个方法上事务相关的属性，根据具体属性来判断是否开始新事务

​		2. 当开始新事务时。获取数据库连接，关闭自动提交功能，开启事务

		3. 执行业务逻辑代码
  		4. 在操作过程中，如果失败了，那么会通过completeTransactionAfterThrowing来完成事务的回滚操作。提交的具体逻辑是通过doRollBack实现的，实现也是先要获取连接对象，通过连接对象来回滚。
  		5. 如果成功，那么会通过commitTransactionAfterReturning来完成事务的提交的提交操作,提交的具体逻辑是通过doCommit方法来实现，实现也是需要获取当前连接，通过连接对象来提交

6. 事务执行完毕后要清除相关的事务信息cleanupTransactionInfo

注：TransactionInfo,TransactionStatus是非常重要

### 2. 事务的传播行为：

![image-20211227193225574](spring%E4%BA%8B%E5%8A%A1.assets/image-20211227193225574.png)

总：事务的传播特性是指不同方法的嵌套调用过程中,事务该如何进行。

分：支持当前事务，不支持当前事务，嵌套事务

​		简单判别方式：

- 同一个事务的话，就很简单
- 不同事务：外层方法出错不影响内层方法，但是内层方法有可能会影响外层方法	
- 
