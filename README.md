# activiti6-springboot
* activiti 在 springBoot 中使用的示例
* 前端使用angular js

用例中所有账号密码均为:123456
测试流程：
使用员工 empa登录，申请请假流程；
主管 dira 审批
总监1 managea 审批；
或者总监2 manageb 审批

#　数据库
##　通用数据表
act_ge_bytearray 资源表 用于保存与流程引擎相关的资源；
act_ge＿ｐｒｏｐｅｒｔｙ　属性表　将全部属性抽象成ｋｅｙ－ｖａｌｕｅ对；

##　流程存储表　以ACT_RE开始　ＲＥ是ｒｅｓｐｏｓｉｔｏｒｙ单词缩写
act_re_deployment　部署数据表
act_re_procdef　流程定义表　

##　身份数据表
act_id_user　用户表
act_id_info　用户信息表
act_id_group　用户组表
act_id_membership　用户关系表

##　运行时数据表　　运行时数据表
act_ru_execution　流程实例表
act_ru_task　流程任务表
act_ru_identitylink　流程与身份关系表


##　历史数据表　以ＡＣＴ＿ＨＩ开头


































　