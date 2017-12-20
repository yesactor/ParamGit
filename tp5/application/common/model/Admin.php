<?php
// 简单的原理重复记： namespace说明了该文件位于application\common\model 文件夹中
namespace app\common\model;
use think\Model;    //  导入think\Model类


/**
 * Admin
 */

// 我的类名对应的文件名，该类继承了Model类，Model我们在文件头中，提前使用use进行了导入。
class Admin extends Model
{




    protected $auto = [];
    protected $insert = ['status'=>1];
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';
    protected $type = [
        'logintime' =>  'timestamp:Y/m/d',
    ];



     protected function setIpAttr($ip)
     {
        return request()->ip();
     }
     protected function setNameAttr($value)
     {
        return strtolower($value);
     }
    protected function getStatusAttr($value)
     {
        $status=[-1=>'删除',0=>'禁用',1=>'正常',2=>'检查'];
        return $status[$value];
     }
     protected function setLikeAttr($checked=true)
     {

            cookie(['prefix' => 'remember_', 'expire' => 3600]);
            cookie('adminId', 3600*24);


           return true;
     }
     protected function index()
     {

         return true;
     }






     /**
     * 用户登录
     *@param  string $username 用户名
     *@param  string $password 密码
     *@return bool  成功返回true，失败返回false。
     */
    static public function login($username, $password,$like)
    {


         // 验证用户是否存在
        $map =array('username' => $username);
        $Admin = self::get($map);
        if (!is_null($Admin)){

            if ($Admin->checkPassword($password)) {


                        session('adminId',$Admin->getData('id'));
                         return true ;
            }
        }
            return false;

    }




          /**
           * 验证密码是否正确
           * @param string $password  密码
           * @return bool
           */
         public function checkPassword($password)
    {
        if ($this->getData('password') === $this::encryptPassword($password))
        {
            return true;
        } else {
            return false;
        }
    }
      /**
     * 密码加密算法
     * @param    string                   $password 加密前密码
     * @return   string                             加密后密码
     * @author
     * @DateTime 2016-10-21T09:26:18+0800
     */
        static public function encryptPassword($password)
    {
        if (!is_string($password)) {
            throw new \RuntimeException("传入变量类型非字符串，错误码2", 2);
        }

        // 实际的过程中，我还还可以借助其它字符串算法，来实现不同的加密。
        return sha1(md5($password) . 'bibib');
    }
            /**
     * 系统后台 会员登录后 将会员验证内容写入对应cookie中
     * @param string $name 用户名
     * @param int $id 用户ID
     * @return bool 布尔类型的返回结果
     */
    protected final function systemSetKey($username){
        cookie(COOKIE_PRE.'sys_key',encrypt(serialize($username),MD5_KEY),3600);
    }
        /**
         * 用户注销
         * @return [type] [description]
         */
    public function logOut()
    {
            session('adminId',null);
            return true;

    }


        /**
     * 判断用户是否已登录
     * @return boolean 已登录true
     * @author  panjie <panjie@yunzhiclub.com>
     */
    static public function isLogin()
    {
        $adminId = session('adminId');

        // isset()和is_null()是一对反义词
        if (isset($adminId)) {
            return true;
        } else {
            return false;
        }
    }

    public function editData($data)
    {
        if (isset($data['id'])) {
            if (is_numeric($data['id'])&& $data['id']>0) {
                  $save = $this->allowField(true)->save($data,['id'=>$data['id']]);
            }else{
                $save = $this->allowField(true)->save($data);
            }
        }else{
             $save = $this->allowField(true)->save($data);
        }
        if ($save==0 || $save==false) {
             $res=['code'=>0,'msg'=>'数据更新失败',];
        }else{
              $res=['code'=>1,'msg'=>'数据更新成功',];
        }
        return $res;
    }



}
