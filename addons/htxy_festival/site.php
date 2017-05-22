<?php
/**
 * 过节喽模块微站定义
 *
 * @author 红途小莜
 * @url http://bbs.we7.cc/
 */
defined('IN_IA') or exit('Access Denied');

class Htxy_festivalModuleSite extends WeModuleSite {
	public $active="htxy_festival_active";
	public $website="website";
	public $register="htxy_festival_register";

	public function doMobileFengmian() {
		//这个操作被定义用来呈现 功能封面
	}
	public function doWebActive() {
		//这个操作被定义用来呈现 管理中心导航菜单
		global $_W,$_GPC;

			$pindex = max(1,intval($p));
			$psize = 30;
			$_total = pdo_fetchcolumn("SELECT count(*) FROM ". tablename($this->active) );
			$pager = pagination($_total,$pindex,$psize);
			 // 如果为智诚自己的公众号的话
			if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
				// 若为公众号操作员只能查看自己的项目
				if($_W['role']=="operator"){
					$list = pdo_fetchall("SELECT id,rid,shop_title,active_name,create_time FROM " . tablename($this->active) . "WHERE uniacid=:uniacid and uid=:uid LIMIT ".($pindex-1)*$psize.",{$psize}",array(':uniacid'=>$_W['uniacid'],":uid"=>$_W['uid']));

				}else{
					$list = pdo_fetchall("SELECT id,rid,shop_title,active_name,create_time FROM " . tablename($this->active) . "WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",{$psize}",array(':uniacid'=>$_W['uniacid']));
				}
			}else{
				$list = pdo_fetchall("SELECT id,rid,shop_title,active_name,create_time FROM " . tablename($this->active) . "WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",{$psize}",array(':uniacid'=>$_W['uniacid']));
			}
		include $this->template('active_list');

	}

	//删除活动
	public function doWebDelete_active(){
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		// if(is_array($id)){

		// }
		$rid = intval($_GPC['rid']);
        $rule = pdo_fetch("SELECT id, module FROM " . tablename('rule') . " WHERE id = :id and uniacid=:weid", array(':id' => $rid, ':weid' => $_W['weid']));
        if (empty($rule)) {
            message('抱歉，要修改的规则不存在或是已经被删除！');
        }
        if (pdo_delete('rule', array('id' => $rid))) {
            pdo_delete('rule_keyword', array('rid' => $rid));
            //删除统计相关数据
            pdo_delete('stat_rule', array('rid' => $rid));
            pdo_delete('stat_keyword', array('rid' => $rid));
            //调用模块中的删除
            $module = WeUtility::createModule($rule['module']);
            if (method_exists($module, 'ruleDeleted')) {
                $module->ruleDeleted($rid);
            }
			if($_W['role']=="operator"){
				$del=pdo_query("DELETE FROM ".tablename($this->active)." WHERE id=:id and uid=:uid and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
			}else{
				$del=pdo_query("DELETE FROM ".tablename($this->active)." WHERE id=:id and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid']));
			}
			$url=$this->createWebUrl('active');
			
			if(!empty($del)){
				message('删除成功',$url,"success");
			}else{
				message('删除失败',$url,"error");
			}
        }
	}

	//查看报名记录
	public function doWebRegister_list(){
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		$uniacid=$_W['uniacid'];

		$pindex = max(1,intval($p));
			$psize = 30;
			$_total = pdo_fetchcolumn("SELECT count(*) FROM ". tablename($this->register));
			$pager = pagination($_total,$pindex,$psize);
			 // 如果为智诚自己的公众号的话
			// if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
			// 	// 若为公众号操作员只能查看自己的项目
			// 	if($_W['role']=="operator"){
					$list = pdo_fetchall("SELECT id,user_name,user_phone,create_time FROM " . tablename($this->register) . "WHERE uniacid=:uniacid and active_id=:active_id LIMIT ".($pindex-1)*$psize.",{$psize}",array(':uniacid'=>$uniacid,":active_id"=>$id));

			// 	}else{
			// 		$list = pdo_fetchall("SELECT id,user_name,user_phone,create_time FROM " . tablename($this->register) . "WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",{$psize}",array(':uniacid'=>$_W['uniacid']));
			// 	}
			// }else{
			// 	$list = pdo_fetchall("SELECT id,user_name,user_phone,create_time FROM " . tablename($this->register) . "WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",{$psize}",array(':uniacid'=>$_W['uniacid']));
			// }
		// echo "<pre>";
		// var_dump($list);die;
		 if (checksubmit('export')) {
            /* 输入到CSV文件 */
            $html = "\xEF\xBB\xBF";

            /* 输出表头 */
            $filter = array(
                'user_name' => '姓名',
                'user_phone' => '电话',
                'create_time' => '活动时间',
            );


            foreach ($filter as $key => $value) {
                $html .= $value . "\t,";
            }
            $html .= "\n";

            if (!empty($list)) {
                foreach ($list as $key => $value) {
                    foreach ($filter as $index => $title) {
                        if ($index != 'htxy_festival') {
                            $html .= $value[$index] . "\t, ";
                        } else {
                            $html .= date('Y-m-d H:i:s', $value[$index]) . "\t, ";
                        }
                    }
                    $html .= "\n";
                }
            }

            /* 输出CSV文件 */
            header("Content-type:text/csv");
            header("Content-Disposition:attachment; filename=报名数据.csv");
            echo $html;
            exit();
        }
		include $this->template('register');
	}

	//手机index页面
	public function doMobileIndex() {
		global $_W,$_GPC;
		$rid=intval($_GPC['rid']);
		// 获取的openid
		$openid=$_W['openid'];
		$uniacid=$_W['uniacid'];

		$result=pdo_fetch('SELECT id FROM'.tablename($this->active)."WHERE uniacid=:uniacid and rid=:rid",array(':uniacid'=>$_W['uniacid'],":rid"=>$rid));
		
		// 跳转地址
			$webs=pdo_fetchall("SELECT website FROM".tablename($this->website)."WHERE is_use=:is_use",array(':is_use'=>3));
			$snu=count($webs);
			$rand=mt_rand(0,$snu-1);
			$send_url=$webs[$rand]['website'];
		$url="http://letu20161905.vicp.io/index.php/home/Festival?rid=".$rid."&openid=".$openid."&uniacid=".$_W['uniacid']."&id=".$result['id'];
		// $url="http://".$send_url."/index.php/home/Sweb?rid=".$rid."&openid=".$openid."&uniacid=".$_W['uniacid'];
			header("Location:".$url);
	}

}