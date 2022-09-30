# thinkphp6-auth
基于thinkphp5.1 auth权限修改
Auth 封装的读取当前url和当前数据库url进行匹配
版本更新====》2.0
更新时间2022/09/30
欢迎使用《玫瑰工作室》

继承代码
$auth = new \yangtao\auth\Auth();
$rule_name = app('http')->getName() . '/' . $request->controller() . '/' . lcfirst($request->action());
$result = $auth->check($rule_name, 1);
if (!$result) {
$this->error('没有权限',url('admin/index/index'));
}
