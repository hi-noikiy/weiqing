<?php
/**
 * 测试模块模块微站定义
 *
 * @author wzl
 * @url http://bbs.we7.cc/
 */
defined('IN_IA') or exit('Access Denied');

class Wzl_ceshiModuleSite extends WeModuleSite {

	
	public function doWebRule() {
		//这个操作被定义用来呈现 规则列表
	}
	public function doWebGuanli1() {
		global $_W,$_GPC;
		load()->func('tpl');//加载组件

		if(checksubmit('submit')){
			$data['uniacid'] 		= $_W['uniacid'];
			$data['title'] 			= $_GPC['hdname'];
			$data['start_time'] 	= $_GPC['hdtime']['start'];
			$data['end_time'] 		= $_GPC['hdtime']['end'];
			$data['detail'] 		= $_GPC['hddesc'];
			$data['thumb'] 			= $_GPC['hdimg'];
			$res = pdo_insert('active',$data); //添加数据
			if($res){
				message('活动添加成功',$this->createWebUrl('Guanli1'),'success');
			}else{
				message('活动添加失败','','error');
			}
		}

		$pdo_data = pdo_fetch("SElECT * FROM ".tablename('active')." WHERE `uniacid`=:uniacid",array(':uniacid'=>$_W['uniacid']));
		include $this->template('guanli');
		//这个操作被定义用来呈现 管理中心导航菜单
	}
	public function doMobileNav1() {
		//这个操作被定义用来呈现 微站首页导航图标
	}
	public function doMobileNav2() {
		//这个操作被定义用来呈现 微站个人中心导航
	}
	public function doMobileNav3() {
		//这个操作被定义用来呈现 微站快捷功能导航
	}

}