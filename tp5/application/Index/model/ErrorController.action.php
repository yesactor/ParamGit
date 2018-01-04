<?php
namespace app\index\controller;

class Error
{
    public function _empty($method)
    {
        return '当前操作名：' . $method;
    }
}
