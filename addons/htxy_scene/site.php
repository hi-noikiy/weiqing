<?php
/**
 * 我在现场模块微站定义
 *
 * @author 红途小莜
 * @url http://bbs.we7.cc/
 */
defined('IN_IA') or exit('Access Denied');

class Htxy_sceneModuleSite extends WeModuleSite {
	public $scene_pro="htxy_scene_pro";
	public $scene_member="htxy_scene_members";
	// 项目列表
	public function doWebSenceEdit() {
		//这个操作被定义用来呈现 管理中心导航菜单
		load()->func('tpl');
		global $_W,$_GPC;
		$p = isset($_GPC['page']) ? $_GPC['page'] : 1;
		$pindex = max(1,intval($p));
		$psize = 10;
		$_total = pdo_fetchcolumn("SELECT count(*) FROM ". tablename($this->scene_pro));

		$pager = pagination($_total,$pindex,$psize);
		if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
			// 如果是智诚自家的公众号的话分管理员和操作员查询
			if($_W['role']=="operator"){
				$list = pdo_fetchall("SELECT rid,id,scene_name,create_time,is_show FROM " . tablename($this->scene_pro) ." WHERE uniacid=:uniacid and uid=:uid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
				foreach ($list as $k => $v) {
					$list[$k]['scene_cont']=html_entity_decode($v['scene_cont']);
				}
			}else{
				$list = pdo_fetchall("SELECT rid,id,scene_name,create_time,is_show FROM " . tablename($this->scene_pro) ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));
				foreach ($list as $k => $v) {
					$list[$k]['scene_cont']=html_entity_decode($v['scene_cont']);
				}
				
			}
		}else{ 
			//不是智诚自家的公众号的话管理员和操作员都可以查看到所有的项目
			$list = pdo_fetchall("SELECT rid,id,scene_name,create_time,is_show FROM " . tablename($this->scene_pro) ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));
			foreach ($list as $k => $v) {
					$list[$k]['scene_cont']=html_entity_decode($v['scene_cont']);
				}
		}
		include $this->template('scene_list');
	}
	public function doWebSenceGroup() {
		//这个操作被定义用来呈现 管理中心导航菜单
	}
	public function doWebSenceMember() {
		//这个操作被定义用来呈现 管理中心导航菜单
		echo 369;die;
	}
	public function doWebscene_add() {
		//这个操作被定义用来呈现 管理中心导航菜单
	}
	// 控制显示状态的方法
	public function  doWebEdit_status () {
		global $_W,$_GPC;
		// 状态
		$is_show=intval($_GPC['is_show']);
		// 操作的id
		$id=intval($_GPC['id']);
		// 操作的表名
		$table=$_GPC['table'];
		// 跳转到的页面
		$urls=trim($_GPC['url']);
		$param=array('id'=>$id,'uniacid'=>$_W['uniacid']);
		$ui=$this->$table;
		// echo $ui;die;
		$url=$this->createWebUrl($urls);
			if($is_show==1){
				$data['is_show']=0;
				$result=pdo_update($this->$table,$data,$param);
				if($result){
					message('项目编辑成功',$url,"success");
				}else{
					message('项目编辑失败',$url,"error");
				}	
			}else{
				$data['is_show']=1;
				$result=pdo_update($this->$table,$data,$param);
				if($result){
					message('项目编辑成功',$url,"success");
				}else{
					message('项目编辑失败',$url,"error");
				}	
			}
	}
	//栏目删除
	public function doWebSceneDele(){
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
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
				$del=pdo_query("DELETE FROM ".tablename($this->scene_pro)." WHERE id=:id and uid=:uid and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
			}else{
				$del=pdo_query("DELETE FROM ".tablename($this->scene_pro)." WHERE id=:id and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid']));
			}
			$url=$this->createWebUrl('SenceEdit');
			
			if(!empty($del)){
				message('删除成功',$url,"success");
			}else{
				message('删除失败',$url,"error");
			}
	}

}